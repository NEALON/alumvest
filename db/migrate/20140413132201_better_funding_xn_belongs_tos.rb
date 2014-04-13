class BetterFundingXnBelongsTos < ActiveRecord::Migration
  def change
    remove_column :bancbox_funding_xns, :investment_id, :integer
    add_column :bancbox_funding_xns, :payment_id, :integer
  end
end
