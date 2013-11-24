class Banking::Account < ActiveRecord::Base
  attr_accessible :user, :user_id

  belongs_to :user
  has_one :bancbox_identity_verification, :class_name => 'Bancbox::IdentityVerification', :foreign_key => :banking_account_id
  has_one :bancbox_account, :class_name => 'Bancbox::Account', :foreign_key => :banking_account_id

  # TODO: should be a state machine so that we can see if they have verified their identity and all of that
  # TODO: association to identity
  # TODO: has_one identity, etc.
end
