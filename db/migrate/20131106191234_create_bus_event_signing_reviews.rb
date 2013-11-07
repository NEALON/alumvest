class CreateBusEventSigningReviews < ActiveRecord::Migration
  def change
    add_column :bus_events, :signing_id, :integer
    add_column :bus_events, :admin_id, :integer
  end
end
