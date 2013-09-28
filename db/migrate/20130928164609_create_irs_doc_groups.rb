class CreateIrsDocGroups < ActiveRecord::Migration
  def change
    create_table :irs_doc_groups do |t|
      t.string :status

      t.references :investment_finalization
      t.timestamps
    end
  end
end
