class AddBancboxStatusToBancboxEscrow < ActiveRecord::Migration
  def change
    add_column :bancbox_escrows, :bancbox_status, :string, :default => "unsubmitted"
  end
end
