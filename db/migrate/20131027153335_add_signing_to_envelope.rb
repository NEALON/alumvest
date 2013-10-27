class AddSigningToEnvelope < ActiveRecord::Migration
  def change
    add_column :docusign_envelopes, :signing_id, :integer
  end
end
