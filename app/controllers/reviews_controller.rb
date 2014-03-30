class ReviewsController < ApplicationController
  def go_live
    campaign = CampaignBase.find(params[:campaign_id])
    Alumvest::Review.create(:campaign => campaign, :result => 'go_live')
    Bus::Event::Campaign::WentLive.create(:campaign => campaign, :issuer => campaign.issuer)
    campaign.go_live
    redirect_to campaign_events_user_admin_path(current_user),
                :flash => {:success => 'Campaign was reviewed with a Go Live outcome.'}
  end

  def reject
    campaign = CampaignBase.find(params[:campaign_id])
    Alumvest::Review.create(:campaign => campaign, :result => 'reject')
    Bus::Event::Campaign::Rejected.create(:campaign => campaign, :issuer => campaign.issuer)
    campaign.reject
    redirect_to campaign_events_user_admin_path(current_user),
                :flash => {:success => 'Campaign was reviewed with a Reject outcome.'}
  end
end
