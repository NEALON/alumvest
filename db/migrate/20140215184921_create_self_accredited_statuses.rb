class CreateSelfAccreditedStatuses < ActiveRecord::Migration
  def change
    create_table :self_accredited_statuses do |t|
      t.integer :financial_status
      t.boolean :term_startup_fail
      t.boolean :term_responsible
      t.boolean :term_av_permission
      t.boolean :term_tos
      t.references :investor, index: true

      t.timestamps
    end
  end
end
