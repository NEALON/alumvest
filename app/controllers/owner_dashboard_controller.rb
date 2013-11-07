class OwnerDashboardController < ApplicationController
  def index
    @investor_signings = Signing.investor_signature_approved
  end
end
