class AddTranscriptToVtOrder < ActiveRecord::Migration
  def change
    add_column :veritax_orders, :vt_transcript, :text
  end
end
