class HomeController < ApplicationController
  def index
    @reviewable_campaigns = Campaign.reviewable.sample(3)
  end
end
