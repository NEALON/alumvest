class AddTypeToUserNIdentity < ActiveRecord::Migration
  def up
    add_column :users, :user_type, :string, default: "guest"
    add_column :identities, :user_type, :string, default: "guest"
  end
  
  def down
    remove_column :users, :user_type
    remove_column :identities, :user_type
  end
end
