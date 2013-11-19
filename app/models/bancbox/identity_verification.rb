class Bancbox::IdentityVerification < ActiveRecord::Base
  attr_accessible :is_verified, :user, :user_id

  belongs_to :user
end
