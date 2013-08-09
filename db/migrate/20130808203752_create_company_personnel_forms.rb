class CreateCompanyPersonnelForms < ActiveRecord::Migration
  def change
    create_table :company_personnel_forms do |t|
      t.timestamps
    end
  end
end
