class RemovePermalinkAndHeadline < ActiveRecord::Migration
  def change
    remove_column :companies, :permalink
    remove_column :companies, :headline
  end
end
