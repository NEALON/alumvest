class CreateBusEventInvestmentInitiated < ActiveRecord::Migration
  def change
    add_column :bus_events, :investment_id, :integer
  end
end
