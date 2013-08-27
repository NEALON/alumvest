class RenameCompanyName < ActiveRecord::Migration
  def change
    rename_column :companies, :name, :company_name
  end
end
