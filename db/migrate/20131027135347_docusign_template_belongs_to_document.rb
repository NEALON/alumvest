class DocusignTemplateBelongsToDocument < ActiveRecord::Migration
  def change
    add_column :docusign_templates, :document_id, :integer
  end
end
