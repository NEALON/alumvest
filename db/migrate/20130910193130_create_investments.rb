class CreateInvestments < ActiveRecord::Migration
  def change
    create_table :investments do |t|
      t.decimal :amount
      t.string :status

      t.references :campaign
      t.references :investor
      t.timestamps
    end
  end
end
