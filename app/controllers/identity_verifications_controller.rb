class IdentityVerificationsController < ApplicationController

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @investment_finalization = InvestmentFinalization.find(params[:investment_finalization_id])
    unless @investment_finalization.identity_verification
      IdentityVerification.create(:investment_finalization => @investment_finalization)
    end
    redirect_to campaign_investment_finalization_identity_verification_path(@campaign, @investment_finalization)
  end

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @investment_finalization = InvestmentFinalization.find(params[:investment_finalization_id])
    @investment_finalization.identity_verification.complete
    redirect_to campaign_investment_finalization_path(@campaign, @investment_finalization), :flash => {:success => 'Item completed.'}
  end

  def show
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @investment_finalization = InvestmentFinalization.find(params[:investment_finalization_id])
    @identity_verification = @investment_finalization.identity_verification
  end
end

