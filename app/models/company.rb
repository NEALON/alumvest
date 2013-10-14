class Company < ActiveRecord::Base

  attr_accessible :company_name,
                  :logo_url,
                  :short_description,
                  :company_url,
                  :campaign_title,
                  :company_highlights,
                  :company_details,
                  :founded_on_year,
                  :ownership_structure,
                  :category_id,
                  :address_1,
                  :address_2,
                  :city,
                  :state,
                  :zip,
                  :phone,
                  :faq,
                  :video_url,
                  :photo_url,
                  :banner_photo_url,
                  :status,
                  :campaign_id,
                  :campaign

  attr_reader :invalid_items

  has_filepicker_image :logo, :styles => {:medium => [300, 300], :thumb => [100, 100]}
  has_filepicker_image :photo
  has_filepicker_image :banner_photo

  belongs_to :campaign
  belongs_to :category
  has_many :updates
  has_many :jobs

  state_machine :status, :initial => :draft do
    event :make_ready_for_review do
      transition :draft => :ready_for_review
    end

    state :ready_for_review do
      [:company_name,
       :logo_url,
       :short_description,
       :company_url,
       :campaign_title,
       :company_highlights,
       :company_details,
       :founded_on_year,
       :ownership_structure,
       :category_id,
       :address_1,
       :city,
       :state,
       :zip,
       :phone,
       :faq,
       :video_url,
       :banner_photo_url].each do |attr|
        validates attr, :presence => true
      end
    end
  end

  # image display helpers

  def photo_for_card_display
    photo(:w => 218, :h => 110, :fit => "crop").try(:sub, /https:/, "http:")
  end

  def banner_for_campaign_home_display
    banner_photo(:w => 960, :h => 400, :fit => "crop").try(:sub, /https:/, "http:")
  end
end
