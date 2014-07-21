class AddColumnToOnlinePayment < ActiveRecord::Migration
  def change
    add_column :online_payments, :nickname, :string
  end
end
