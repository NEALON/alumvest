class Campaign < ActiveRecord::Base
  attr_accessible :permalink,
                  :pitch,
                  :amount,
                  :planned_fund_usage,
                  :length_in_days,
                  :company_worksheet_id

  validates_presence_of [:permalink,
                    :pitch,
                    :amount,
                    :planned_fund_usage,
                    :length_in_days]

  validates_numericality_of [:amount, :length_in_days]

  belongs_to :company_worksheet
end
