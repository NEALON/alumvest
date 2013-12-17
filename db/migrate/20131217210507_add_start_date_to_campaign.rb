class AddStartDateToCampaign < ActiveRecord::Migration
  def change
    add_column :campaigns, :starts_on, :datetime
  end
end
