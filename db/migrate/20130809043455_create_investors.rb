class CreateInvestors < ActiveRecord::Migration
  def change
    create_table :investors do |t|
      t.string :ssn
      t.string :marital_status
      t.text :financial_info
      t.text :spending_habits
      t.string :income
      t.string :income_type
      t.string :net_worth
      t.string :investor_representations
      t.string :industry
      t.string :company
      t.string :job_title
      t.string :experience
      t.string :expertise
      t.string :accredited_investor_status
      t.text :personal_message
      t.references :user

      t.timestamps
    end
    add_index :investors, :user_id
  end
end
