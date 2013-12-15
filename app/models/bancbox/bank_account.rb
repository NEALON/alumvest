class Bancbox::BankAccount < ActiveRecord::Base

  attr_accessible :user, :user_id

  belongs_to :user
  has_many :fund_transactions, :class_name => 'Bancbox::FundTransaction'

  attr_accessible :bancbox_id,
                  :reference_id,
                  :bank_account_number,
                  :bank_account_type,
                  :bank_account_holder,
                  :bank_account_routing

  validates_presence_of [:bank_account_number, :bank_account_type, :bank_account_holder, :bank_account_routing]
end
