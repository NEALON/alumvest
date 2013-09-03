class HomeController < ApplicationController
  def index
    @companies = Company.active.sample(3)
  end
end
