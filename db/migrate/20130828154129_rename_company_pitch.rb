class RenameCompanyPitch < ActiveRecord::Migration
  def change
    rename_column :companies, :pitch, :faq
  end
end
