class RemoveRedundantFieldsFromFundingXn < ActiveRecord::Migration
  def change
    remove_column :bancbox_funding_xns, :bank_account_number, :string
    remove_column :bancbox_funding_xns, :bank_account_type, :string
    remove_column :bancbox_funding_xns, :bank_account_holder, :string
    remove_column :bancbox_funding_xns, :bank_account_routing, :string
  end
end
