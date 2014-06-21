require 'active_support/concern'

module Alumvest::CompanyPresenters
  extend ActiveSupport::Concern

  module ClassMethods
    require 'oembed'
  end

  included do

    def photo_for_card_display
      photo(:w => 300, :h => 160, :fit => "crop").try(:sub, /https:/, "http:")
    end

    def banner_for_campaign_home_display
      banner_photo(:w => 960, :h => 400, :fit => "crop").try(:sub, /https:/, "http:")
    end

    def home_photo_display
      home_photo(:w => 597, :h => 486).try(:sub, /https:/, "http:")
    end

    def slideshare
      return @slideshare if @slideshare
      return unless slideshare_url
      @slideshare = OEmbed::Providers::Slideshare.get(slideshare_url)
      if (!@slideshare.slideshow_id)
        @slideshare = nil
      end
      return @slideshare
    rescue
      @slideshare = nil
    end

    def slideshare_embed_url
      "http://www.slideshare.net/slideshow/embed_code/#{slideshare.slideshow_id}"
    end
  end
end