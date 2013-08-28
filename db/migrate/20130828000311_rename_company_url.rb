class RenameCompanyUrl < ActiveRecord::Migration
  def change
    rename_column :companies, :url, :company_url
  end
end
