class BancboxBankAccount < ActiveRecord::Base
  belongs_to :bancbox_investor
  belongs_to :bancbox_issuer
end
