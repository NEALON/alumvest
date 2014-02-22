class HomeController < ApplicationController
  def index
    @live_campaigns = CampaignBase.live.sample(3)
    @reviewable_campaigns = CampaignBase.reviewable.sample(3)
  end
end
