class RenameDocusignTemplateToTemplate < ActiveRecord::Migration
  def up
    rename_table :docusign_templates, :templates
  end

  def down
    rename_table :templates, :docusign_templates
  end
end
