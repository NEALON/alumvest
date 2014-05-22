class AddSlideshareUrl < ActiveRecord::Migration
  def change
    add_column :companies, :slideshare_url, :string
  end
end
