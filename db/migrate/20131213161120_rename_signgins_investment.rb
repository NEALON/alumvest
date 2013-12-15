class RenameSignginsInvestment < ActiveRecord::Migration
  def change
    rename_column :signings, :investment_finalization_id, :investment_id
  end
end
