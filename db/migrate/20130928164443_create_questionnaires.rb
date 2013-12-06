class CreateQuestionnaires < ActiveRecord::Migration
  def change
    create_table :questionnaires do |t|
      t.string :status
      t.string :annual_income
      t.string :year_of_income
      t.string :income_type
      t.string :net_worth

      t.references :investment
      t.timestamps
    end
  end
end
