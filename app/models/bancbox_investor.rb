class BancboxInvestor < ActiveRecord::Base
  
  attr_accessible :name, :ssn, :investor_type, :email, :phone, :date_of_birth, :address_1, :address_2, :city_state_zip, :user, :user_id

  # TODO: in a subsequent state
  # validates_presence_of [:name, :ssn, :investor_type, :email, :phone, :date_of_birth, :address_1, :city_state_zip]

  belongs_to :user

  state_machine :bancbox_status, :initial => :unsubmitted

end
