require 'active_support/concern'

module Alumvest::CampaignPresenters
  extend ActiveSupport::Concern

  included do
    def humanize_time_left
      "#{investment_term.try(:campaign_length) || 'TBD'} Days"
    end

    def percent_complete_for_display
      investment_sum = 0 # investments.sum(:amount)
      if investment_sum == 0
        2 # so something shows in the progress bar
      else
        investment_sum / investment_term.fundraising_amount * 100
      end
    end
  end
end