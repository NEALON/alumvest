class AddVtErrorToOrder < ActiveRecord::Migration
  def change
    add_column :veritax_orders, :vt_error, :string
    add_column :veritax_orders, :vt_status, :string
  end
end
