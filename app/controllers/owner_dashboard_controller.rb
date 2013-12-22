class OwnerDashboardController < ApplicationController
  def index
    @campaigns = Campaign.where(:owner_id => current_user.owner.id)
    @investor_signings = Signing.investor_signature_approved
  end

  def create_campaign
    campaign = Campaign.create(:owner => current_user.owner)
    redirect_to new_campaign_company_path(campaign)
  end
end
