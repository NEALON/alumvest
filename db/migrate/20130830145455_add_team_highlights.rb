class AddTeamHighlights < ActiveRecord::Migration

  def change
    add_column :teams, :team_highlights, :text
  end
end
