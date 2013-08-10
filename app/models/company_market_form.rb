class CompanyMarketForm < ActiveRecord::Base
  attr_accessible :product_media_url,  :market_info, :competitive_landscape

  validates_presence_of [:product_media_url,  :market_info, :competitive_landscape]
end