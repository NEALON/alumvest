class Market < ActiveRecord::Base
  attr_accessible :product_media_url,
                  :market_info,
                  :competitive_landscape,
                  :company_id,
                  :company

  belongs_to :company

  state_machine :status, :initial => :draft do
    event :make_ready_for_review do
      transition :draft => :ready_for_review
    end

    state :ready_for_review do
      [:product_media_url,
       :market_info,
       :competitive_landscape].each do |attr|
        validates attr, :presence => true
      end
    end
  end

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