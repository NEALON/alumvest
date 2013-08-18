class HomeController < ApplicationController
  def index
    @campaigns = Campaign.all.sample(3)
  end
end
