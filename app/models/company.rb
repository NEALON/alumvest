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
                  :owner_id,
                  :owner

  attr_reader :invalid_items

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
       :banner_photo_url].each do |attr|
        validates attr, :presence => true
      end
    end
  end

  state_machine :aggregate_status, :initial => :new do # status for all company sections; maybe should be its own 'thing'
    event :submit_for_review do
      transition :new => :submitted_for_admin_review, :if => :all_valid?
    end

    state :submitted_for_admin_review
  end

  def all_valid?
    @invalid_items = []
    @invalid_items << 'Company' unless self.valid?
    @invalid_items << 'Team' unless team.valid?
    @invalid_items << 'Investment Terms' unless investment_term.valid?
    @invalid_items.blank?
  end

  # scopes

  def self.active
    where(:status => "active")
  end

  # image display helpers

  def photo_for_card_display
    photo(:w => 300, :h => 150, :fit => "crop").try(:sub, /https:/, "http:")
  end

  def banner_for_campaign_home_display
    banner_photo(:h => 400, :w => 1500, :fit => "crop").try(:sub, /https:/, "http:")
  end
end