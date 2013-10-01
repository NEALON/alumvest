class CreateInvestmentFinalizations < ActiveRecord::Migration
  def change
    create_table :investment_finalizations do |t|
      t.string :status

      t.references :campaign
      t.references :investor
      t.timestamps
    end
  end
end
