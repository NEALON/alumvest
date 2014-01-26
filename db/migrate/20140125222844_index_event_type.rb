class IndexEventType < ActiveRecord::Migration
  def change
    add_index :bus_events, :type
  end
end
