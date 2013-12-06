class CreateSignings < ActiveRecord::Migration
  def change
    create_table :signings do |t|
      t.string :status, :default => 'unsigned'

      t.references :investment
      t.references :document

      t.timestamps
    end
  end
end
