class HomeController < ApplicationController
  def index
    @live_campaigns = Campaign.live.sample(3)
    @reviewable_campaigns = Campaign.reviewable.sample(3)
  end
end
