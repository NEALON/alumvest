class BancboxEscrowsController < ApplicationController

  def create
    campaign = CampaignBase.find(params[:campaign_id])
    begin
      Bancbox::Escrow::Base.create_from_campaign(campaign.issuer.user, campaign)
    rescue Exception => e
      if e.message == 'The campaign issuer needs to have an account on Bancbox'
        redirect_to campaign_events_user_admin_path(current_user), :flash => {:warning => e.message}
      end
    end
  end
end