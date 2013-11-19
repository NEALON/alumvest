class Bancbox::FundTransaction < ActiveRecord::Base
  belongs_to :bancbox_bank_account
  belongs_to :investor, :class_name => 'Bancbox::Investor'
  belongs_to :issuer, :class_name => 'Bancbox::Issuer'

  attr_accessible :trans_id, :status, :trans_status, :amount, :memo, :text
  attr_accessible :bancbox_bank_account, :bancbox_bank_account_id
  attr_accessible :bancbox_investor, :bancbox_issuer, :bancbox_investor_id, :bancbox_issuer_id
end
