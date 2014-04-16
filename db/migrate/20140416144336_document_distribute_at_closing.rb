class DocumentDistributeAtClosing < ActiveRecord::Migration
  def change
    add_column :documents, :distribute_at_closing, :boolean, :default => false
  end
end
