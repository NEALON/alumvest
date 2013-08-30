class AddPeopleVideoUrl < ActiveRecord::Migration
  def change
    add_column :people, :video_url, :string
  end
end
