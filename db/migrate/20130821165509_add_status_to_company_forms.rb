class AddStatusToCompanyForms < ActiveRecord::Migration
  def change
    add_column :company_basic_forms, :status, :string
    add_column :company_funding_doc_forms, :status, :string
    add_column :markets, :status, :string
    add_column :company_personnel_forms, :status, :string
  end
end
