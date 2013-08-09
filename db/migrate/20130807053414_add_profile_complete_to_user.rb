class AddProfileCompleteToUser < ActiveRecord::Migration
  def up
    add_column :users, :profile_complete, :boolean, default: false
  end
  
  def down
    remove_column :users, :profile_complete
  end
end
