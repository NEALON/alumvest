class AddAggregateStatusToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :aggregate_status, :string
  end
end
