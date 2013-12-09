class RmUsersProfileComplete < ActiveRecord::Migration
  def change
    remove_column :users, :profile_complete, :boolean
  end
end
