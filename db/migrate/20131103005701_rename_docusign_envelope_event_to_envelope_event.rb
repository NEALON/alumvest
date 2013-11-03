class RenameDocusignEnvelopeEventToEnvelopeEvent < ActiveRecord::Migration
  def up
    rename_table :docusign_envelope_events, :envelope_events
  end

  def down
    rename_table :envelope_events, :docusign_envelope_events
  end
end
