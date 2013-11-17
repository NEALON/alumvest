class BancboxInvestor < ActiveRecord::Base

  attr_accessible :first_name, :last_name, :ssn, :investor_type, :email, :phone, :date_of_birth, :address_1, :address_2, :city, :state, :zip
  attr_accessible :user, :user_id
  attr_accessible :bank_name, :account_number, :account_routing_number, :account_type
  attr_accessible :agreement

  # TODO: in a subsequent state
  validates_presence_of [:first_name, :last_name, :ssn, :investor_type, :email, :phone, :date_of_birth, :address_1, :city, :state, :zip], :on => :update
  validates_inclusion_of :agreement, :in => [true], :on => :update

  belongs_to :user

  state_machine :bancbox_status, :initial => :unsubmitted do
    state :submitted
    event :submit do
      transition :unsubmitted => :submitted
    end
  end

  after_create do
    unless self.user.blank?
      u = self.user
      self.first_name = u.first_name
      self.last_name = u.last_name
      self.email = u.email
    end
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def submit!
    if self.reference_id.blank?
      self.reference_id = SecureRandom.uuid
    end
    options = {
      :first_name => self.first_name,
      :last_name => self.last_name,
      :email => self.email,
      :phone => self.phone,
      :address_1 => self.address_1,
      :city => self.city,
      :state => self.state,
      :zip => self.zip,
      :ssn => self.ssn,
      :dob => self.date_of_birth,
      :created_by => self.name,
      :reference_id => self.reference_id
    }
    ret = BancBoxCrowd.create_investor options
    if ret['error'].nil?
      self.bancbox_id = ret['id']
      self.bank_name = ret['bank_name']
      self.account_number = ret['account_number']
      self.account_routing_number = ret['account_routing_number']
      self.account_type = ret['account_type']

      if self.agree!
        self.fire_bancbox_status_event(:submit)
        self.save
      end
    end
  end

  def agree!
    # get my own ip
    require 'socket'
    ip=Socket.ip_address_list.detect{|intf| intf.ipv4_private?}
    myip = ip ? ip.ip_address : "127.0.0.1"
    options = {
      :id => self.bancbox_id,
      :represented_signature => self.name,
      :agreement_type => 'CLICKTHROUGH',
      :document_text => "I agree to Privacy Policy, Platform Agreement, Technology Agreement @ bancboxinvest.com",
      :document_name => "T&C",
      :document_version => "1.0",
      :client_ip_address => myip,
      :submit_time_stamp => DateTime.now.strftime('%Y-%m-%d %H:%M:%S')
    }
    ret = BancBoxCrowd.submit_agreement options
    return ret['error'].nil?
  end

end
