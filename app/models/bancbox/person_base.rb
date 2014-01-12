class Bancbox::PersonBase < ActiveRecord::Base

  self.abstract_class = true

  attr_accessible :first_name,
                  :middle_initial,
                  :last_name,
                  :email,
                  :phone,
                  :address_1,
                  :address_2,
                  :city,
                  :state,
                  :zip,
                  :funds,
                  :pendingbalance,
                  :agreement,
                  :bancbox_id
  attr_encrypted :ssn, :key => 'secret'

  # has_many :fund_transactions, :as => :fundable
  # has_many :bank_accounts
  # accepts_nested_attributes_for :bank_accounts, :fund_transactions

  validates_presence_of [:first_name, :last_name, :email, :phone, :address_1, :city, :state, :zip], :on => :update
  validates_inclusion_of :agreement, :in => [true], :on => :update

  state_machine :bancbox_status, :initial => :unsubmitted do
    state :submitted
    event :submit do
      transition :unsubmitted => :submitted
    end
  end

  def populate_fields_from_user(user)
    update_attributes(
        :first_name => user.first_name,
        :last_name => user.last_name,
        :email => user.email,
        :phone => user.home_phone,
        :address_1 => user.address_1,
        :address_2 => user.address_2,
        :city => user.city,
        :state => user.state,
        :zip => user.zipcode
    )
  end

  def name
    "#{first_name} #{last_name}"
  end

  def create_reference_id!
    if reference_id.blank?
      self.reference_id = SecureRandom.uuid
    end
  end

  def submit!(bank_account)
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
        :bank_account_number => bank_account.bank_account_number,
        :bank_account_type => bank_account.bank_account_type,
        :bank_account_holder => bank_account.bank_account_holder,
        :bank_account_routing => bank_account.bank_account_routing,
        :created_by => 'Alumvest',
        :internal => 1,
        :verification_required => 0,
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
        fire_bancbox_status_event(:submit) # aka submit event in state machine
        bank_account.save

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
    ip=Socket.ip_address_list.detect { |intf| intf.ipv4_private? }
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

  def link_bank_account(type, bank_account)
    options = {
        :bank_account_number => bank_account.bank_account_number,
        :bank_account_type => bank_account.bank_account_type,
        :bank_account_holder => bank_account.bank_account_holder,
        :bank_account_routing => bank_account.bank_account_routing
    }
    if type == :investor
      options[:investor_id] = bancbox_id
    else
      options[:issuer_id] = bancbox_id
    end

    ret = BancBoxCrowd.link_external_account options
    if ret['status']
      bank_account.bancbox_id = ret['linked_external_account']['id']
      bank_account.reference_id = ret['linked_external_account']['reference_id']
      bank_account.save
    end
  end

  def has_bancbox_account?
    not bancbox_id.nil?
  end
end
