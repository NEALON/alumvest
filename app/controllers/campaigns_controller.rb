class CampaignsController < ApplicationController

  before_filter :load_campaign, :except => :publish

  def publish
    @campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    authorize! :manage, @campaign
    if @campaign.publish
      redirect_to user_issuer_events_path(current_user), :flash => {:success => 'Congratulations! Your campaign is now published and ready for our review.'}
    else
      redirect_to campaign_company_path(@campaign), :flash => {:warning => company.invalid_items.join(', ')}
    end
  end

  def follow
    if current_user and current_user.id == params[:alumvest_follow][:user_id].to_i
      current_user.follow!(@campaign)
      redirect_to display_campaign_company_path(@campaign),
                  :flash => {:success => 'You successfully followed this campaign.'}
    else
      redirect_to display_campaign_company_path(@campaign)
    end
  end

  def unfollow
    if current_user and current_user.id == params[:alumvest_follow][:user_id].to_i and current_user.following?(@campaign)
      current_user.unfollow!(@campaign)
      redirect_to display_campaign_company_path(@campaign),
                  :flash => {:success => 'You successfully stopped following this campaign.'}
    else
      redirect_to display_campaign_company_path(@campaign)
    end
  end

  private

  def load_campaign
    @campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    @user = @campaign.issuer.user
  end
end
