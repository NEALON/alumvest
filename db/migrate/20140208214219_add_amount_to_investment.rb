class AddAmountToInvestment < ActiveRecord::Migration
  def change
    add_column :investments, :amount, :decimal
    drop_table :funding_levels
  end
end
