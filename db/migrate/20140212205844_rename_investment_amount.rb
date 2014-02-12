class RenameInvestmentAmount < ActiveRecord::Migration
  def change
    rename_column :investments, :amount, :amount_cents
  end
end
