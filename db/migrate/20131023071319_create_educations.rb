class CreateEducations < ActiveRecord::Migration
  def up
    create_table :educations do |t|
      t.string :school
      t.string :degree
      t.references :user
      t.references :person

      t.timestamps
    end
  end

  def down
    drop_table :educations
  end
end
