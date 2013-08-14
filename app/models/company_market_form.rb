class CompanyMarketForm < ActiveRecord::Base
  attr_accessible :product_media_url,
                  :market_info,
                  :competitive_landscape,
                  :company_worksheet_id

  belongs_to :company_worksheet

  def image_for_product_media_url
    if product_media_url
      @image_for_product_media ||= begin
        response = HTTParty.get("http://api.embed.ly/1/oembed?key=6df201d3d6b8438983bfa7de1d9c8854&format=json&url=#{product_media_url}")
        case response.parsed_response['type']
          when 'photo'
            response.parsed_response['url']
          when 'video'
            response.parsed_response['thumbnail_url']
          when nil
            ''
        end
      end
    end
  end
end