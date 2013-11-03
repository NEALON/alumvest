class AdminDashboardController < ApplicationController
  def index
    @investor_signings = Signing.signed_by_investor
  end
end
