class CreateCompanyWorksheets < ActiveRecord::Migration
  def change
    create_table :company_worksheets do |t|

      t.references :owner
      t.timestamps
    end
  end
end
