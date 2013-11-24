class Bancbox::IdentityVerification < ActiveRecord::Base
  attr_accessible :is_verified, :banking_account, :banking_account_id

  belongs_to :banking_account, :class_name => 'Banking::Account'

  state_machine :status, :initial => :unverified do
    event :verify! do
      transition :unverified => :verified #, :if => :can_be_verified?
    end
    event :reject! do
      transition :unverified => :rejected
    end

    state :unverified
    state :verified
    state :rejected
  end

  def can_be_verified?
    true # TODO: obviously a placeholder for actual verification
  end
end
