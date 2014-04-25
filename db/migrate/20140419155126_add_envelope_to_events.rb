class AddEnvelopeToEvents < ActiveRecord::Migration
  def change
    add_column :bus_events, :envelope_id, :integer
  end
end
