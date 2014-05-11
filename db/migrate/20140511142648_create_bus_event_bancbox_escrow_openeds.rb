class CreateBusEventBancboxEscrowOpeneds < ActiveRecord::Migration
  def change
    add_column :bus_events, :bancbox_escrow_id, :integer
  end
end
