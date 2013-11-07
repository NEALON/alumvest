class CreateBusEvents < ActiveRecord::Migration
  def change
    create_table :bus_events do |t|
      t.string :type

      t.timestamps
    end
  end
end
