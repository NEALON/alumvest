class DropOldIdentityVerifications < ActiveRecord::Migration
  def change
    drop_table :identity_verifications
  end
end
