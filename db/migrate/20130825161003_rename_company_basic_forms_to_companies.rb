class RenameCompanyBasicFormsToCompanies < ActiveRecord::Migration
  def change
    rename_table :company_basic_forms, :companies
  end
end
