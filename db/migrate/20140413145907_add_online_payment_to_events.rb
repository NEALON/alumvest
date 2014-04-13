class AddOnlinePaymentToEvents < ActiveRecord::Migration
  def change
    add_column :bus_events, :payment_id, :integer
  end
end
