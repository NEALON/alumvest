class AddColumnToOnlinePayment < ActiveRecord::Migration
  def change
    add_column :online_payments, :nickname, :string
    add_column :online_payments, :accept_terms, :boolean
  end
end
