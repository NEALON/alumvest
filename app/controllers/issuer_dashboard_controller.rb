class IssuerDashboardController < ApplicationController
  def index
    @campaigns = Alumvest::Campaign::Base.where(:issuer_id => current_user.issuer.id)
    @investor_signings = Alumvest::Signing::Base.investor_signature_approved
  end

  def create_campaign
    campaign = Alumvest::Campaign::Base.create(:issuer => current_user.issuer)
    redirect_to new_campaign_company_path(campaign)
  end
end
