class CreateContractDocGroups < ActiveRecord::Migration
  def change
    create_table :contract_doc_groups do |t|
      t.string :status

      t.references :investment_finalization
      t.timestamps
    end
  end
end
