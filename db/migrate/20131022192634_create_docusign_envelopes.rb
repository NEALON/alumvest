class CreateDocusignEnvelopes < ActiveRecord::Migration
  def change
    create_table :docusign_envelopes do |t|
      t.integer :template_id
      t.string :envelope_id
      t.string :email_subject
      t.string :uri
      t.text :email_body

      t.timestamps
    end
  end
end
