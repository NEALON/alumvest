class Bancbox::Escrow < ActiveRecord::Base
  belongs_to :issuer, class_name: 'Bancbox::Issuer', :foreign_key => :bancbox_issuer_id
  belongs_to :campaign

  attr_accessible :name, :start_date, :close_date, :funding_goal
  attr_accessible :minimum_funding_amount, :maximum_funding_amount, :securities_offered
  attr_accessible :issuer_signatory_email, :issuer_signatory_name, :issuer_signatory_title
  attr_accessible :campaign_id, :campaign
  attr_accessible :issuer_id, :issuer

  validates_presence_of [:name, :start_date, :close_date, :funding_goal]
  validates_presence_of [:minimum_funding_amount, :maximum_funding_amount, :securities_offered]
  validates_presence_of [:issuer_signatory_email, :issuer_signatory_name, :issuer_signatory_title]

  state_machine :bancbox_status, :initial => :unsubmitted do
    state :open_pending
    state :opened
    state :modify_pending
    state :close_pending
    state :closed
    state :cancel_pending
    state :cancel
    state :disburse_pending
    event :submit_open do
      transition :unsubmitted => :open_pending
    end
    event :submit_close do
      transition all => :close_pending
    end
    event :submit_cancel do
      transition all => :cancel_pending
    end
    event :submit_disburse do
      transition all => :disburse_pending
    end
    event :escrow_opened do
      transition all => :opened
    end
    event :escrow_closed do
      transition all => :closed
    end
  end

  def create_reference_id!
    if reference_id.blank?
      self.reference_id = SecureRandom.uuid
    end
  end

  def current_timestamp
    DateTime.now.strftime('%Y-%m-%d %H:%M:%S')
  end

  def server_ip
    require 'socket'
    ip=Socket.ip_address_list.detect{|intf| intf.ipv4_private?}
    myip = ip ? ip.ip_address : "127.0.0.1"
    return myip
  end

  def open!
    return false unless self.valid?
    return true if self.opened?
    create_reference_id!
    options = {
      :name => name,
      :issuer_id => issuer.bancbox_id,
      :start_date => start_date.to_s,
      :close_date => close_date.to_s,
      :funding_goal => funding_goal,
      :created_by => issuer.name,
      :minimum_funding_amount => minimum_funding_amount,
      :maximum_funding_amount => maximum_funding_amount,
      :securities_offered => securities_offered,
      :issuer_signatory_name => issuer_signatory_name,
      :issuer_signatory_email => issuer_signatory_email,
      :issuer_signatory_title => issuer_signatory_title,
      :platform_signatory_name => "Lynn Chen",
      :platform_signatory_email => "kyle@alumvest.com",
      :platform_signatory_title => "CEO"
    }
    options[:over_funding_amount] = over_funding_amount unless over_funding_amount.blank?
    begin
      ret = BancBoxCrowd.create_escrow options
      self.bancbox_id = ret['id']
      self.status = ret['status']
      self.current_balance = ret['current_balance']
      self.total_funding = ret['total_funding']
      save
      fire_bancbox_status_event(:submit_open)
      return true
    rescue BancBoxCrowd::Error
      return false
    end
  end

  def get_details
    options = {
      :escrow_id => bancbox_id
    }
    return BancBoxCrowd.get_escrow_details options
  end

  def get_activity
    options = {
      :escrow_id => bancbox_id
    }
    return BancBoxCrowd.get_escrow_activity options
  end

  # TODO this should pass in a transaction model - kyle
  def fund!(investor, bank_account, amount)
    return false unless self.opened?
    if amount < minimum_funding_amount or amount > maximum_funding_amount
      return false
    end

    options = {
      :escrow_id => bancbox_id,
      :investor_id => investor.bancbox_id,
      :amount => amount,
      :bank_account_number => bank_account.bank_account_number,
      :bank_account_type => bank_account.bank_account_type,
      :bank_account_holder => bank_account.bank_account_holder,
      :bank_account_routing => bank_account.bank_account_routing,
      :text => "I authorize BancBox to make this transaction",
      :client_ip_address => server_ip,
      :submit_timestamp => current_timestamp
    }
    begin
      BancBoxCrowd.fund_escrow options
      return true
    rescue BancBoxCrowd::Error
      return false
    end
  end

  def update_from_server!
    ret = get_details
    self.status = ret['status']
    if self.status == 'OPEN'
      self.escrow_opened!
    end
    self.current_balance = ret['current_balance']
    self.total_funding = ret['notional_balance']
    save
  end
end
