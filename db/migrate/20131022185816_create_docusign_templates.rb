class CreateDocusignTemplates < ActiveRecord::Migration
  def change
    create_table :docusign_templates do |t|
      t.string :template_id

      t.timestamps
    end
  end
end
