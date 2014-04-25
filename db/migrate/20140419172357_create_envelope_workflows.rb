class CreateEnvelopeWorkflows < ActiveRecord::Migration
  def change
    create_table :envelope_workflows do |t|
      t.integer :contract_doc_group_id
      t.integer :template_id
      t.string :status

      t.timestamps
    end
  end
end
