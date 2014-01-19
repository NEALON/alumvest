class CreateBusEventVeritaxOrderSubmitted < ActiveRecord::Migration
  def change
    add_column :bus_events, :investor_id, :integer
    add_column :bus_events, :veritax_order_id, :integer
  end
end