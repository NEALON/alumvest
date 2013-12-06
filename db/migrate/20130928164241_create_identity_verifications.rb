class CreateIdentityVerifications < ActiveRecord::Migration
  def change
    create_table :identity_verifications do |t|
      t.string :status

      t.references :investment
      t.timestamps
    end
  end
end
