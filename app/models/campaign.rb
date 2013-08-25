class Campaign < ActiveRecord::Base
  attr_accessible :permalink,
                  :pitch,
                  :planned_fund_usage,
                  :company_worksheet_id

  validates_presence_of [:permalink,
                    :pitch,
                    :planned_fund_usage]

  belongs_to :company_worksheet
end
