class AdminDashboardController < ApplicationController
  def index
    @investor_signings = Signing.signed_by_investor
  end

  def approve_investor_signing
    if Bus::Event::SigningApproved.create(
        :signing => Signing.find(params[:signing]),
        :admin => User.find(params[:admin])
    )
      redirect_to admin_dashboard_path, :flash => {:success => "Signing approved."}
    else
      redirect_to admin_dashboard_path, :flash => {:danger => "Could not approve signing."}
    end
  end

  def reject_investor_signing
    if Bus::Event::SigningRejected.create(
        :signing => Signing.find(params[:signing]),
        :admin => User.find(params[:admin])
    )
      redirect_to admin_dashboard_path, :flash => {:success => "Signing rejected."}
    else
      redirect_to admin_dashboard_path, :flash => {:danger => "Could not reject signing."}
    end
  end
end
