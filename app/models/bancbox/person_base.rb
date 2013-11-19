class Bancbox::PersonBase < ActiveRecord::Base

  self.abstract_class = true

  attr_accessible :first_name, :middle_initial, :last_name, :ssn, :email, :phone, :date_of_birth, :address_1, :address_2, :city, :state, :zip
  attr_accessible :user, :user_id
  attr_accessible :bank_name, :account_number, :account_routing_number, :account_type, :funds, :pendingbalance
  attr_accessible :agreement

  has_many :investor_bank_accounts,
           dependent: :destroy,
           class_name: "Bancbox::BankAccount",
           foreign_key: :bancbox_investor_id
  has_many :investor_fund_transactions,
           dependent: :destroy,
           class_name: "Bancbox::FundTransaction",
           foreign_key: :bancbox_investor_id
  has_many :issuer_bank_accounts,
           dependent: :destroy,
           class_name: "Bancbox::BankAccount",
           foreign_key: :bancbox_issuer_id
  has_many :issuer_fund_transactions,
           dependent: :destroy,
           class_name: "Bancbox::FundTransaction",
           foreign_key: :bancbox_issuer_id

  accepts_nested_attributes_for :investor_bank_accounts, :investor_fund_transactions
  accepts_nested_attributes_for :issuer_bank_accounts, :issuer_fund_transactions

  validates_presence_of [:first_name, :last_name, :ssn, :email, :phone, :date_of_birth, :address_1, :city, :state, :zip], :on => :update
  validates_inclusion_of :agreement, :in => [true], :on => :update

  state_machine :bancbox_status, :initial => :unsubmitted do
    state :submitted
    event :submit do
      transition :unsubmitted => :submitted
    end
  end

  after_create do
    unless user.blank?
      u = user
      self.first_name = u.first_name
      self.last_name = u.last_name
      self.email = u.email
    end
  end

  def name
    "#{first_name} #{last_name}"
  end

  def create_reference_id!
    if reference_id.blank?
      self.reference_id = SecureRandom.uuid
    end
  end

  def submit!
    create_reference_id!
    options = {
      :first_name => first_name,
      :middle_initial => middle_initial,
      :last_name => last_name,
      :email => email,
      :phone => phone,
      :address_1 => address_1,
      :city => city,
      :state => state,
      :zip => zip,
      :ssn => ssn,
      :dob => date_of_birth,
      :created_by => name,
      :reference_id => reference_id
    }
    ret = yield options
    if ret['error'].nil?
      self.bancbox_id = ret['id']
      self.bank_name = ret['bank_name']
      self.account_number = ret['account_number']
      self.account_routing_number = ret['account_routing_number']
      self.account_type = ret['account_type']

      if agree!
        fire_bancbox_status_event(:submit)
        save
      end
    end
  end

  def get_details
    options = {
      :investor_id => bancbox_id
    }
    yield options
  end

  def server_ip
    require 'socket'
    ip=Socket.ip_address_list.detect{|intf| intf.ipv4_private?}
    myip = ip ? ip.ip_address : "127.0.0.1"
    return myip
  end

  def current_timestamp
    DateTime.now.strftime('%Y-%m-%d %H:%M:%S')
  end

  def agree!
    options = {
      :id => bancbox_id,
      :represented_signature => name,
      :agreement_type => 'CLICKTHROUGH',
      :document_text => "I agree to Privacy Policy, Platform Agreement, Technology Agreement @ bancboxinvest.com",
      :document_name => "T&C",
      :document_version => "1.0",
      :client_ip_address => server_ip,
      :submit_time_stamp => current_timestamp
    }
    ret = BancBoxCrowd.submit_agreement options
    return ret['status']
  end

  def fund_account_common_options(amount, memo)
    {
      :represented_signature => name,
      :reference_id => reference_id,
      :amount => amount,
      :memo => memo,
      :text => "I authorize BancBox to make this transaction",
      :agreement_type => 'CLICKTHROUGH',
      :document_name => 'doc',
      :document_version => 1.0,
      :client_ip_address => server_ip,
      :submit_timestamp => DateTime.now
    }
  end

  # TODO
  def fund_account!
      #(amount, memo, text, bancbox_bank_account)
  end

  def fund_account_and_link_bank!(type, amount, memo,
                                  bank_account_number,
                                  bank_account_type,
                                  bank_account_holder,
                                  bank_account_routing)
    options = fund_account_common_options(amount, memo)
    options.merge!({
      :bank_account_number => bank_account_number,
      :bank_account_type => bank_account_type,
      :bank_account_holder => bank_account_holder,
      :bank_account_routing => bank_account_routing,
      :link_bank_account => true,
    })
    if type == :investor
      options[:investor_id] = bancbox_id
    else
      options[:issuer_id] = bancbox_id
    end
    logger.info options
    ret = BancBoxCrowd.fund_account options
    logger.info ret
    # XXX should catch the error
    if ret['status']
      bank_account_hash = {
        :bank_account_number => bank_account_number,
        :bank_account_type => bank_account_type,
        :bank_account_holder => bank_account_holder,
        :bank_account_routing => bank_account_routing,
        :bancbox_id => ret['linked_external_account']['id'],
        :reference_id => ret['linked_external_account']['reference_id']
      }
      if type == :investor
        bank_account_hash[:bancbox_investor_id] = id
      else
        bank_account_hash[:bancbox_issuer_id] = id
      end
      bank_account = BancboxBankAccount.create(bank_account_hash)
      fund_transaction_hash = {
        :bancbox_investor_id => bancbox_id,
        :trans_id => ret['transaction_details']['id'],
        :status => ret['transaction_details']['status'],
        :trans_status => ret['transaction_details']['trans_status'],
        :amount => amount,
        :memo => memo,
        :bancbox_bank_account => bank_account
      }
      if type == :investor
        fund_transaction_hash[:bancbox_investor_id] = id
      else
        fund_transaction_hash[:bancbox_issuer_id] = id
      end
      FundTransaction.create(fund_transaction_hash)

      self.pendingbalance += amount
      save
    end
  end
end
