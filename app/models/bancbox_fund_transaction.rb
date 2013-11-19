class BancboxFundTransaction < ActiveRecord::Base
  belongs_to :bancbox_bank_account
  belongs_to :bancbox_investor
  belongs_to :bancbox_issuer

  attr_accessible :trans_id, :status, :trans_status, :amount, :memo, :text
  attr_accessible :bancbox_bank_account, :bancbox_bank_account_id
  attr_accessible :bancbox_investor, :bancbox_issuer, :bancbox_investor_id, :bancbox_issuer_id
end
