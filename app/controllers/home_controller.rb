class HomeController < ApplicationController
  def index
    @live_campaigns = Alumvest::CampaignBase.live.sample(3)
    @reviewable_campaigns = Alumvest::CampaignBase.reviewable.sample(3)
  end
end
