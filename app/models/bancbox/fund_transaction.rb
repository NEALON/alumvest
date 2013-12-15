# XXX This class is no longer needed per bancbox new api
# TODO delete the model
class Bancbox::FundTransaction < ActiveRecord::Base

  belongs_to :bank_account, :class_name => 'Bancbox::BankAccount', :foreign_key => :bancbox_bank_account_id
  belongs_to :fundable, :polymorphic => true

  attr_accessible :trans_id,
                  :status,
                  :trans_status,
                  :amount,
                  :memo,
                  :text,
                  :bancbox_bank_account,
                  :bancbox_bank_account_id

  validates :amount, numericality: true
end
