class DropIrs < ActiveRecord::Migration
  def change
    drop_table :irs_doc_groups
  end
end
