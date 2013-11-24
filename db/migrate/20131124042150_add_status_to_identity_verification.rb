class AddStatusToIdentityVerification < ActiveRecord::Migration
  def change
    add_column :bancbox_identity_verifications, :status, :string
  end
end
