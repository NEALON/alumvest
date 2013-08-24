class RenameFundingDocsToInvestmentTerms < ActiveRecord::Migration
  def change
    rename_table :company_funding_doc_forms, :investment_terms
  end
end
