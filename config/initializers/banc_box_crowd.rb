require 'banc_box_crowd'

BancBoxCrowd.configure do |config|
  if Rails.env.production?
    config.base_url = "https://api.bancboxcrowd.com/crowd/v0/cfp/"
  else
    config.base_url = "https://sandbox-api.bancboxcrowd.com/crowd/v0/cfp/"
  end
  config.api_key = "eadcf103-8150-494d-b956-8ea78b7eac03"
  config.api_secret = "7a28c43ccb"
end
