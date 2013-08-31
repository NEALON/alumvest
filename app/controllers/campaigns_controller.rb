class CampaignsController < ApplicationController
  def show
    @company = Company.find(params[:id])
    @user = @company.owner.user
  end
end
