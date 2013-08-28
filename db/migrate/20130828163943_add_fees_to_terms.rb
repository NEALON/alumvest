class AddFeesToTerms < ActiveRecord::Migration
  def change
    add_column :investment_terms, :fees_paid_by, :string
  end
end
