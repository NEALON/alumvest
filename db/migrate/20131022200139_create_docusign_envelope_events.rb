class CreateDocusignEnvelopeEvents < ActiveRecord::Migration
  def change
    create_table :docusign_envelope_events do |t|
      t.integer :docusign_envelope_id
      t.string :status
      t.datetime :status_date_time

      t.timestamps
    end
  end
end
