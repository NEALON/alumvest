class ReviewsController < ApplicationController
  def accept
    campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    Alumvest::Review.create(:campaign => campaign, :result => 'accept')
    Bus::Event::Campaign::Accepted.create(:campaign => campaign, :issuer => campaign.issuer)
    campaign.accept
    IssuerMailer.accept(campaign.issuer.user.email).deliver
    redirect_to campaign_events_user_admin_path(current_user),
                :flash => {:success => 'Campaign was reviewed and accepted.'}
  end

  def reject
    campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    Alumvest::Review.create(:campaign => campaign, :result => 'reject')
    Bus::Event::Campaign::Rejected.create(:campaign => campaign, :issuer => campaign.issuer)
    IssuerMailer.reject(campaign.issuer.user.email).deliver
    campaign.reject
    redirect_to campaign_events_user_admin_path(current_user),
                :flash => {:success => 'Campaign was reviewed and rejected.'}
  end
end
