class BancboxInvestor < ActiveRecord::Base

  attr_accessible :first_name, :last_name, :ssn, :investor_type, :email, :phone, :date_of_birth, :address_1, :address_2, :city, :state, :zip, :user, :user_id
  attr_accessible :bank_name, :account_number, :account_routing_number, :account_type

  # TODO: in a subsequent state
  # validates_presence_of [:name, :ssn, :investor_type, :email, :phone, :date_of_birth, :address_1, :city_state_zip]

  belongs_to :user

  state_machine :bancbox_status, :initial => :unsubmitted do
    state :submitted
  end

  def create!
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
      :created_by => "#{self.first_name} #{self.last_name}",
      :reference_id => self.reference_id
    }
    ret = BancBoxCrowd.create_investor options
    if ret['error'].nil?
      self.bancbox_id = ret['id']
      self.bank_name = ret['bank_name']
      self.account_number = ret['account_number']
      self.account_routing_number = ret['account_routing_number']
      self.account_type = ret['account_type']
      self.save
    end
  end

  def created?
    not self.bancbox_id.nil?
  end

end
