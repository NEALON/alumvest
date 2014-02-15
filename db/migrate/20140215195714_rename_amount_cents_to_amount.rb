class RenameAmountCentsToAmount < ActiveRecord::Migration
  def change
    rename_column :investments, :amount_cents, :amount
  end
end
