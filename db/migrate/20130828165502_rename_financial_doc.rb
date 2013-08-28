class RenameFinancialDoc < ActiveRecord::Migration
  def change
    rename_column :investment_terms, :tbd_financial_document_url, :financial_statement_url
  end
end
