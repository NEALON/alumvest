class AddStatusToOnlinePayment < ActiveRecord::Migration
  def change
    add_column :online_payments, :status, :string
  end
end
