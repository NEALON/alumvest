class Veritax::OrderBase < ActiveRecord::Base
  include Veritax::OrderBatch
  include Veritax::OrderState
  include Veritax::OrderEvents
  include Veritax::OrderVeritaxCalls

  self.table_name = :veritax_orders

  attr_accessible :investor,
                  :investor_id,
                  :ssn,
                  :first_name,
                  :last_name,
                  :address,
                  :city,
                  :state,
                  :zip_code,
                  :previous_address,
                  :previous_city,
                  :previous_state,
                  :previous_zip,
                  :email,
                  :vt_order_id,
                  :vt_error,
                  :vt_status,
                  :vt_transcript,
                  :status
  attr_encrypted :ssn, :key => (Rails.env.test? ? 'ssn_secret' : ENV['SSN_SECRET'])

  validates_presence_of [:ssn, :first_name, :last_name, :address, :city, :state, :zip_code, :email]

  belongs_to :investor, :class_name => 'Alumvest::InvestorBase'

  def self.drafted
    where(:status => 'draft')
  end

  def self.submitted
    where(:status => 'submitted')
  end
end