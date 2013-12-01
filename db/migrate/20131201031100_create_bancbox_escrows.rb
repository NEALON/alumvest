class CreateBancboxEscrows < ActiveRecord::Migration
  def change
    create_table :bancbox_escrows do |t|
      t.string :name
      t.string :reference_id
      t.string :bancbox_id
      t.date :start_date
      t.date :close_date
      t.float :funding_goal
      t.float :minimum_funding_amount
      t.string :securities_offered
      t.string :securities_offered_other
      t.float :over_funding_amount
      t.float :maximum_funding_amount
      t.float :current_balance
      t.float :total_funding
      t.string :status
      t.string :issuer_signatory_email
      t.string :issuer_signatory_name
      t.string :issuer_signatory_title
      t.string :disbursement_status
      t.string :disbursal_started
      t.references :bancbox_issuer
      t.references :campaign

      t.timestamps
    end
  end
end
