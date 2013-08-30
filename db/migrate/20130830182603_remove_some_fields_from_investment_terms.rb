class RemoveSomeFieldsFromInvestmentTerms < ActiveRecord::Migration

  def change
    remove_column :investment_terms, :tbd_detailed_metrics_document_url
    remove_column :investment_terms, :recent_investors
    remove_column :investment_terms, :roadmap
    remove_column :investment_terms, :shareholder_message
  end
end
