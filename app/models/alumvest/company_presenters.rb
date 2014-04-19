require 'active_support/concern'

module Alumvest::CompanyPresenters
  extend ActiveSupport::Concern

  included do
    def photo_for_card_display
      photo(:w => 218, :h => 110, :fit => "crop").try(:sub, /https:/, "http:")
    end

    def banner_for_campaign_home_display
      banner_photo(:w => 960, :h => 400, :fit => "crop").try(:sub, /https:/, "http:")
    end
  end
end