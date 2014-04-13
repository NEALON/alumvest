require 'active_support/concern'

module Alumvest::OnlinePaymentEvents
  extend ActiveSupport::Concern

  included do
    def generate_funding_event
      # Bus::Event::InvestmentFunded.create(:campaign => self, :issuer => self.issuer)
      true
    end
  end
end