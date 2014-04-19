class AddEnvelopeWorkflowToEvents < ActiveRecord::Migration
  def change
    add_column :bus_events, :envelope_workflow_id, :integer
  end
end
