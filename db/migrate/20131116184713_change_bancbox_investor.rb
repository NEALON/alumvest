class ChangeBancboxInvestor < ActiveRecord::Migration
  def change
    add_column :bancbox_investors, :first_name, :string
    add_column :bancbox_investors, :last_name, :string
    add_column :bancbox_investors, :city, :string
    add_column :bancbox_investors, :state, :string
    add_column :bancbox_investors, :zip, :string
    add_column :bancbox_investors, :reference_id, :string
    add_column :bancbox_investors, :bancbox_id, :string
    remove_column :bancbox_investors, :name
    remove_column :bancbox_investors, :city_state_zip
  end
end
