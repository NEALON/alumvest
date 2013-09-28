class CreatePaymentInformations < ActiveRecord::Migration
  def change
    create_table :payment_informations do |t|
      t.string :status

      t.references :investment_finalization
      t.timestamps
    end
  end
end
