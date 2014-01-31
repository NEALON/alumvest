require 'active_support/concern'

module Alumvest::Campaign::Events
  extend ActiveSupport::Concern

  included do
    def generate_event
      Bus::Event::CampaignSubmittedForReview.create(:campaign => self)
    end
  end
end