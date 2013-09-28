class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.string :status

      t.references :investment_finalization
      t.timestamps
    end
  end
end
