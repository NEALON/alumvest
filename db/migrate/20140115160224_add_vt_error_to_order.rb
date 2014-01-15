class AddVtErrorToOrder < ActiveRecord::Migration
  def change
    add_column :veritax_orders, :vt_error, :string
  end
end
