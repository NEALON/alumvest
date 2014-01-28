class IssuerDashboardController < ApplicationController
  def index
    @campaigns = Campaign.where(:issuer_id => current_user.issuer.id)
    @investor_signings = Signing.investor_signature_approved
  end

  def create_campaign
    campaign = Campaign.create(:issuer => current_user.issuer)
    redirect_to new_campaign_company_path(campaign)
  end
end
