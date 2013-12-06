class RenameInvestmentFinalizationToInvestment < ActiveRecord::Migration
  def change
    rename_table :investment_finalizations, :investments
    rename_column :contract_doc_groups, :investment_finalization_id, :investment_id
    rename_column :funding_levels, :investment_finalization_id, :investment_id
    rename_column :irs_doc_groups, :investment_finalization_id, :investment_id
    rename_column :questionnaires, :investment_finalization_id, :investment_id
  end
end

