class CompanyMarketForm < ActiveRecord::Base
  attr_accessible :product_media_url,  :market_info, :competitive_landscape,
      :company_worksheet_id


  belongs_to :company_worksheet

  validates_presence_of [:product_media_url,  :market_info, :competitive_landscape]
end