require 'active_support/concern'

module Alumvest::CompanyState
  extend ActiveSupport::Concern

  included do
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
  end
end