class RenamePesonnelToTeam < ActiveRecord::Migration
  def change
    rename_table :company_personnel_forms, :teams
  end
end
