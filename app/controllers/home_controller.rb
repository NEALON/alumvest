class HomeController < ApplicationController
  def index
    @live_campaigns = Alumvest::Campaign::Base.live.sample(3)
    @reviewable_campaigns = Alumvest::Campaign::Base.reviewable.sample(3)
  end
end
