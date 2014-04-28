class SigningBelongsToContractDocGroup < ActiveRecord::Migration
  def change
    remove_column :signings, :investment_id, :integer
    remove_column :signings, :document_id, :integer
    add_column :signings, :contract_doc_group_id, :integer
    add_column :signings, :template_id, :integer
  end
end
