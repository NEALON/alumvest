class DropOldInvestments < ActiveRecord::Migration
  def change
    drop_table :investments
  end
end
