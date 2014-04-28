class RemoveEnvelopeWorkflowsFromBusEvents < ActiveRecord::Migration
  def change
    remove_column :bus_events, :envelope_workflow_id, :integer
  end
end
