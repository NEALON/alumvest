class BancboxAgreement < ActiveRecord::Base
  
  attr_accessible :is_agreed, :user, :user_id

  belongs_to :user
end
