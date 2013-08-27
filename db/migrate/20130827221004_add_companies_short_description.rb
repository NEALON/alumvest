class AddCompaniesShortDescription < ActiveRecord::Migration
  def change
    add_column :companies, :short_description, :string
  end
end
