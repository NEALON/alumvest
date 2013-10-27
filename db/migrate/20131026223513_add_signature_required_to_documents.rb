class AddSignatureRequiredToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :signature_required, :boolean, :default => false
  end
end
