class Bancbox::BankAccount < ActiveRecord::Base

  DefaultRoutingNumber = '267084199'
  attr_accessible :user, :user_id

  belongs_to :user, :class_name => 'Alumvest::UserBase'

  attr_accessible :bancbox_id,
                  :reference_id,
                  :bank_account_number,
                  :bank_account_type,
                  :bank_account_holder,
                  :bank_account_routing

  validates_presence_of [:bank_account_number, :bank_account_type, :bank_account_holder, :bank_account_routing]
end
