class CreateVeritaxOrders < ActiveRecord::Migration
  def change
    create_table :veritax_orders do |t|
      t.string :ssn, :null => false
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :address, :null => false
      t.string :city, :null => false
      t.string :state, :null => false
      t.string :zip_code, :null => false
      t.string :previous_address
      t.string :previous_city
      t.string :previous_state
      t.string :previous_zip
      t.string :email, :null => false
      t.string :vt_order_id
      t.string :status

      t.belongs_to :investor

      t.timestamps
    end
  end
end
