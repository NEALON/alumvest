class HomeController < ApplicationController
  def index
    raise "test exception"
    @reviewable_campaigns = Campaign.reviewable.sample(3)
  end
end
