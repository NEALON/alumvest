class CampaignsController < ApplicationController
  def show
    @campaign = Campaign.find(params[:id])
    @company = @campaign.company
    @user = @campaign.owner.user
  end

  def submit_for_review
    @campaign = Campaign.find(params[:campaign_id])
    if @campaign.submit_for_review
      redirect_to campaign_company_path(@campaign), :notice => 'Congratulations! Your campaign is now submitted for review.'
    else
      redirect_to campaign_company_path(@campaign), :error => company.invalid_items.join(', ')
    end
  end

  def team
    @campaign = Campaign.find(params[:campaign_id])
    @user = @campaign.owner.user
  end

  def investment_term
    @campaign = Campaign.find(params[:campaign_id])
    @user = @campaign.owner.user
  end

  def updates
    @campaign = Campaign.find(params[:campaign_id])
    @user = @campaign.owner.user
  end

  def join_us
    @campaign = Campaign.find(params[:campaign_id])
    @user = @campaign.owner.user
  end
end
