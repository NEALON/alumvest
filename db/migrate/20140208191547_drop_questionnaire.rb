class DropQuestionnaire < ActiveRecord::Migration
  def change
    drop_table :questionnaires
  end
end
