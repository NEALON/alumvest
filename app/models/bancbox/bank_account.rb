class Bancbox::BankAccount < ActiveRecord::Base

  DefaultRoutingNumber = '267084199'
  attr_accessible :user, :user_id

  #after_save :notify_manager
  #def notify_manager
  #  BancboxAccountManager.banking_account_updated!(user, self)
  #end

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
