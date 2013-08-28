class RenameCompanyIntroductions < ActiveRecord::Migration
  def change
    rename_column :companies, :company_introductions, :company_details
  end
end
