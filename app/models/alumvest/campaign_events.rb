require 'active_support/concern'

module Alumvest::CampaignEvents
  extend ActiveSupport::Concern

  included do
    def generate_published_event
      Bus::Event::Campaign::Published.create(:campaign => self, :issuer => self.issuer)
    end

    def generate_went_live_event

      Bus::Event::Campaign::WentLive.create(
          :campaign => self,
          :issuer => issuer
      )
      IssuerMailer.campaign_went_live(issuer.user.email).deliver
    end
  end
end