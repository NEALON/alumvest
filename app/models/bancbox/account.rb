class Bancbox::Account < ActiveRecord::Base

  has_many :deposits, :class_name => 'Bancbox::Deposit', :foreign_key => :bancbox_account_id
  has_many :withdrawals, :class_name => 'Bancbox::Withdrawal', :foreign_key => :bancbox_account_id
  has_many :transactions, :class_name => 'Bancbox::Transaction', :foreign_key => :bancbox_account_id

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

  def balance
    deposits.sum(:value) - withdrawals.sum(:value)
  end
end
