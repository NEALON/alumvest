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
                  :permalink,
                  :headline,
                  :status,
                  :owner_id,
                  :owner

  has_filepicker_image :logo, :styles => {:medium => [300, 300], :thumb => [100, 100]}
  has_filepicker_image :photo
  has_filepicker_image :banner_photo

  belongs_to :owner
  belongs_to :category
  has_one :team
  has_one :investment_term
  has_many :updates

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
       :banner_photo_url,
       :permalink,
       :headline].each do |attr|
        validates attr, :presence => true
      end
    end
  end
end