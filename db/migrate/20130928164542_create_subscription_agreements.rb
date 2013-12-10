class CreateSubscriptionAgreements < ActiveRecord::Migration
  def change
    create_table :subscription_agreements do |t|
      t.string :status

      t.references :investment_finalization
      t.timestamps
    end
  end
end
