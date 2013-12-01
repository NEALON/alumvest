class OwnerDashboardController < ApplicationController
  def index
    @campaigns = Campaign.where(:owner_id => current_user.owner.id)
    @investor_signings = Signing.investor_signature_approved
  end
end
