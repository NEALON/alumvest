class HomeController < ApplicationController
  def index
    @companies = Company.all.sample(3)
  end
end
