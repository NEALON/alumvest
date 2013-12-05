class RenamePaymentInformationToFundingLevel < ActiveRecord::Migration
  def change
    rename_table :payment_informations, :funding_levels
  end
end
