class AddElevatorPitchToTerms < ActiveRecord::Migration
  def change
    add_column :investment_terms, :elevator_pitch, :text
  end
end
