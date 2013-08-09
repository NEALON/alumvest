class RenameUserTypeInIdentities < ActiveRecord::Migration
  def up
    rename_column :identities, :user_type, :description
  end

  def down
    rename_column :identities, :description, :user_type
  end
end
