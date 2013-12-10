# XXX This class is no longer needed per bancbox new api
# TODO delete the model
class Bancbox::FundTransaction < ActiveRecord::Base
  # poly
  belongs_to :bank_account, :class_name => 'Bancbox::BankAccount', :foreign_key => :bancbox_bank_account_id
  belongs_to :investor, :class_name => 'Bancbox::Investor', :foreign_key => :bancbox_investor_id
  belongs_to :issuer, :class_name => 'Bancbox::Issuer', :foreign_key => :bancbox_issuer_id

  attr_accessible :trans_id, :status, :trans_status, :amount, :memo, :text
  attr_accessible :bancbox_bank_account, :bancbox_bank_account_id
  attr_accessible :bancbox_investor, :bancbox_issuer, :bancbox_investor_id, :bancbox_issuer_id

  validates :amount, numericality: true
end
