class AddHomePhotoUrl < ActiveRecord::Migration
  def change
    add_column :companies, :home_photo_url, :string
  end
end
