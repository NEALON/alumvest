class FixIdentityColumn < ActiveRecord::Migration
  def up
    rename_column :identities, :name, :first_name
    add_column :identities, :last_name, :string
  end

  def down
    rename_column :identities, :first_name, :name
    remove_column :identities, :last_name
  end
end
