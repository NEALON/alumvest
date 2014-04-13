require 'active_support/concern'

module Alumvest::OnlinePaymentEvents
  extend ActiveSupport::Concern

  included do
    def generate_funding_event
      Bus::Event::Investment::Funded.create(
          :campaign => investment.campaign,
          :investment => investment,
          :investor => investment.investor,
          :issuer => investment.campaign.issuer)
    end
  end
end