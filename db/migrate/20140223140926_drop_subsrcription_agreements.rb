class DropSubsrcriptionAgreements < ActiveRecord::Migration
  def change
    drop_table :subscription_agreements
  end
end
