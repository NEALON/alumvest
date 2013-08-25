class AddStuffAndMoveStuff < ActiveRecord::Migration
  def change
    remove_column :campaigns, :permalink
    remove_column :campaigns, :pitch
    remove_column :campaigns, :planned_fund_usage
    add_column :company_basic_forms, :permalink, :string
    add_column :company_basic_forms, :pitch, :text
    add_column :investment_terms, :planned_fund_usage, :text
  end
end
