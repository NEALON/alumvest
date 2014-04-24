require 'active_support/concern'

module Alumvest::CampaignEvents
  extend ActiveSupport::Concern

  included do
    def generate_published_event
      Bus::Event::Campaign::Published.create(:campaign => self, :issuer => self.issuer)
    end
  end
end