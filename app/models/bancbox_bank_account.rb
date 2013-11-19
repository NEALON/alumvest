class BancboxBankAccount < ActiveRecord::Base
  belongs_to :bancbox_investor
  belongs_to :bancbox_issuer

  attr_accessible :bancbox_id, :reference_id
  attr_accessible :bank_account_number, :bank_account_type
  attr_accessible :bank_account_holder, :bank_account_routing
  attr_accessible :bancbox_investor, :bancbox_issuer, :bancbox_investor_id, :bancbox_issuer_id
end
