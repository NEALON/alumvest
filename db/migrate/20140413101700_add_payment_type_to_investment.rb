class AddPaymentTypeToInvestment < ActiveRecord::Migration
  def change
    add_column :investments, :payment_type, :string
  end
end
