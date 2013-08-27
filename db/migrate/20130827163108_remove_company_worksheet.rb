class RemoveCompanyWorksheet < ActiveRecord::Migration
  def change
    rename_column :companies, :company_worksheet_id, :owner_id
    rename_column :teams, :company_worksheet_id, :company_id
    rename_column :markets, :company_worksheet_id, :company_id
    rename_column :investment_terms, :company_worksheet_id, :company_id

    drop_table :company_worksheets
  end
end
