class RenameCompanyTitle < ActiveRecord::Migration
  def change
    rename_column :companies, :title, :campaign_title
  end
end
