class CreateCompanyPersonnelForms < ActiveRecord::Migration
  def change
    create_table :company_personnel_forms do |t|
      t.references :company_worksheet
      t.timestamps
    end
  end
end
