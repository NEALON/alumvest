require 'active_support/concern'

module Alumvest::Company::Data
  extend ActiveSupport::Concern

  included do
    self.table_name = :companies

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

    belongs_to :campaign, :class_name => 'Alumvest::Campaign::Base'
    belongs_to :category, :class_name => 'Alumvest::Category::Base'
    has_many :updates, :class_name => 'Alumvest::Update', :foreign_key => 'company_id'
    has_many :jobs, :class_name => 'Alumvest::Job', :foreign_key => 'company_id'
  end
end