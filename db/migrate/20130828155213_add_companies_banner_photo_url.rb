class AddCompaniesBannerPhotoUrl < ActiveRecord::Migration
  def change
    add_column :companies, :banner_photo_url, :string
  end
end
