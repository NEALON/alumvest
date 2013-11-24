class Bancbox::Account < ActiveRecord::Base
  attr_accessible :banking_account, :banking_account_id

  belongs_to :banking_account, :class_name => 'Banking::Account'

  state_machine :status, :initial => :initialized do
    event :create! do
      transition :new => :created
    end
    event :fail! do
      transition :new => :failed
    end

    state :initialized
    state :created
    state :failed
  end
end
