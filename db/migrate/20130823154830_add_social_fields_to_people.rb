class AddSocialFieldsToPeople < ActiveRecord::Migration
  def change
    add_column :people, :facebook, :string
    add_column :people, :twitter, :string
    add_column :people, :linkedin, :string
    add_column :people, :avatar_url, :string
  end
end
