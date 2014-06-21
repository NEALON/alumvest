class AddSchoolToIdentities < ActiveRecord::Migration
  def change
    add_column :identities, :school, :string
  end
end
