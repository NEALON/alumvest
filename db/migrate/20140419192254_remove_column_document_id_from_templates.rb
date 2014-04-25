class RemoveColumnDocumentIdFromTemplates < ActiveRecord::Migration
  def change
    remove_column :templates, :document_id, :integer
    add_column :templates, :name, :string
  end
end
