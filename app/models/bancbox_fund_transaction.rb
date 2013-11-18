class BancboxFundTransaction < ActiveRecord::Base
  belongs_to :bancbox_bank_account
  belongs_to :bancbox_investor
  belongs_to :bancbox_issuer
end
