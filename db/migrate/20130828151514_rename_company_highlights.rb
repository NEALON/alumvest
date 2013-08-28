class RenameCompanyHighlights < ActiveRecord::Migration
  def change
    rename_column :companies, :highlights, :company_highlights
  end
end
