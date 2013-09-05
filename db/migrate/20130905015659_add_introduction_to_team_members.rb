class AddIntroductionToTeamMembers < ActiveRecord::Migration
  def change
    add_column :people, :introduction, :text
  end
end
