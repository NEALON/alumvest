class CampaignsController < ApplicationController

  before_filter :load_campaign, :except => :submit_for_review

  def submit_for_review
    @campaign = Campaign.find(params[:campaign_id])
    if @campaign.submit_for_review
      redirect_to campaign_company_path(@campaign), :notice => 'Congratulations! Your campaign is now submitted for review.'
    else
      redirect_to campaign_company_path(@campaign), :error => company.invalid_items.join(', ')
    end
  end

  def join_us
    load_campaign
  end

  private

  def load_campaign
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @user = @campaign.owner.user
  end
end
