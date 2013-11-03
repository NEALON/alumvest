class RenameDocusignEnvelopeToEnvelope < ActiveRecord::Migration
  def up
    rename_table :docusign_envelopes, :envelopes
    rename_column :docusign_envelope_events, :docusign_envelope_id, :envelope_id
  end

  def down
    rename_table :envelopes, :docusign_envelopes
    rename_column :docusign_envelope_events, :envelope_id, :docusign_envelope_id
  end
end
