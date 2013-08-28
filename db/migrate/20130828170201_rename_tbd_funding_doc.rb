class RenameTbdFundingDoc < ActiveRecord::Migration
  def change
    rename_column :investment_terms, :tbd_funding_document_url, :term_sheet_url
  end
end
