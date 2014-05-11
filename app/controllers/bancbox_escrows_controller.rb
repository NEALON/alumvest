class BancboxEscrowsController < ApplicationController

  def create
    campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    begin
      bbe = Bancbox::EscrowBase.create_from_campaign(campaign.issuer.user, campaign)
      bbe.open_account!
      redirect_to campaign_events_user_admin_path(current_user), :flash => {:success => 'An escrow account was created for the campaign.'}
    rescue Exception => e
      if e.message == 'The campaign issuer needs to have an account on Bancbox'
        redirect_to campaign_events_user_admin_path(current_user), :flash => {:warning => e.message}
      else
        raise e
      end
    end
  end
end