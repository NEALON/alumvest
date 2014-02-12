class ChangeAmountCentsType < ActiveRecord::Migration
  def change
    change_column :investments, :amount_cents, :integer
  end
end
