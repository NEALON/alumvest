class DisambiguateTemplateIdAndDocusingTemplateId < ActiveRecord::Migration
  def change
    rename_column :templates, :template_id, :docusign_template_id
  end
end
