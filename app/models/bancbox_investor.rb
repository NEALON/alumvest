class BancboxInvestor < ActiveRecord::Base
  
  attr_accessible :name, :ssn, :investor_type, :email, :phone, :date_of_birth, :address_1, :address_2, :city_state_zip, :user, :user_id

  # TODO: in a subsequent state
  # validates_presence_of [:name, :ssn, :investor_type, :email, :phone, :date_of_birth, :address_1, :city_state_zip]

  belongs_to :user

  state_machine :bancbox_status, :initial => :unsubmitted

  def create
    options = {
      :first_name => "Kyle",
      :last_name => "Sun",
      :email => "kyle.i1@yopmail.com",
      :phone => "6505555555",
      :address_1 => "444 Rose Street",
      :city => "Miami",
      :state => "FL",
      :zip => 30318,
      :ssn => "112-22-3333",
      :dob => "1975-02-01",
      :created_by => "Admin",
      :reference_id => "kyle_test_i1",
    }
    BancBoxCrowd.create_investor options
  end

end
