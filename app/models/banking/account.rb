class Banking::Account < ActiveRecord::Base
  attr_accessible :user, :user_id

  belongs_to :user
  has_one :bancbox_identity_verification,
          :class_name => 'Bancbox::IdentityVerification',
          :foreign_key => :banking_account_id

  state_machine :status, :initial => :new do
    event :activate! do
      transition :new => :activated
    end

    state :new
    state :activated
  end

  def balance
    bancbox_account.balance
  end
end