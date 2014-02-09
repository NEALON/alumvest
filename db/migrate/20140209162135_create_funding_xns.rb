class CreateFundingXns < ActiveRecord::Migration
  def change
    create_table :bancbox_funding_xns do |t|
      t.string :bank_account_number
      t.string :bank_account_type
      t.string :bank_account_holder
      t.string :bank_account_routing
      t.integer :escrow_id

      t.references :investment

      t.timestamps
    end
  end
end
