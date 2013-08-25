class Campaign < ActiveRecord::Base
  attr_accessible :company_worksheet_id

  belongs_to :company_worksheet
end
