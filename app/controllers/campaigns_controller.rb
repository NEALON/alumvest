class CampaignsController < ApplicationController

  before_filter :load_campaign, :except => :submit_for_review

  def submit_for_review
    @campaign = CampaignBase.find(params[:campaign_id])
    if @campaign.submit_for_review
      redirect_to campaign_company_path(@campaign), :flash => {:success => 'Congratulations! Your campaign is now submitted for review.'}
    else
      redirect_to campaign_company_path(@campaign), :flash => {:warning => company.invalid_items.join(', ')}
    end
  end

  def follow
    if current_user and current_user.id == params[:follow][:user_id].to_i
      current_user.follow!(@campaign)
      redirect_to display_campaign_company_path(@campaign), :flash => {:success => 'Successfully follow this campaign.'}
    else
      redirect_to display_campaign_company_path(@campaign)
    end
  end

  def unfollow
    if current_user and current_user.id == params[:follow][:user_id].to_i and current_user.following?(@campaign)
      current_user.unfollow!(@campaign)
      redirect_to display_campaign_company_path(@campaign), :flash => {:success => 'Successfully unfollow this campaign.'}
    else
      redirect_to display_campaign_company_path(@campaign)
    end
  end

  private

  def load_campaign
    @campaign = CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    @user = @campaign.issuer.user
  end
end
