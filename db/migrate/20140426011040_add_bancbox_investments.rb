class AddBancboxInvestments < ActiveRecord::Migration
  def change
    create_table :bancbox_investments do |t|
      t.integer :bancbox_investor_id
      t.string :project
      t.datetime :investment_date
      t.decimal :amount
      t.boolean :is_refunded
      t.boolean :is_cfp_fee_refunded
      t.boolean :is_reversed
      t.boolean :can_reverse

      t.timestamps
    end
  end
end
