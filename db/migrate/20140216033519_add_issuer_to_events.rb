class AddIssuerToEvents < ActiveRecord::Migration
  def change
    add_column :bus_events, :issuer_id, :integer
  end
end
