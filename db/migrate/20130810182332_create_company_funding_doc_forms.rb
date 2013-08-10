class CreateCompanyFundingDocForms < ActiveRecord::Migration
  def change
    create_table :company_funding_doc_forms do |t|
      t.string :business_plan_url
      t.string :tbd_financial_document_url
      t.string :tbd_funding_document_url
      t.string :tbd_detailed_metrics_document_url
      t.text :recent_investors
      t.text :roadmap
      t.text :shareholder_message

      t.timestamps
    end
  end
end
