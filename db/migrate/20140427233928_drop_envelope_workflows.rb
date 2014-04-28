class DropEnvelopeWorkflows < ActiveRecord::Migration
  def change
    drop_table :envelope_workflows
  end
end
