class ChangeAmountCentsTypeBack < ActiveRecord::Migration
  def change
    change_column :investments, :amount_cents, :decimal, :precision => 8, :scale => 2
  end
end
