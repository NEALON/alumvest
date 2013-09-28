class SubscriptionAgreementsController < ApplicationController

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @investment_finalization = InvestmentFinalization.find(params[:investment_finalization_id])
    unless @investment_finalization.subscription_agreement
      SubscriptionAgreement.create(:investment_finalization => @investment_finalization)
    end
    redirect_to campaign_investment_finalization_subscription_agreement_path(@campaign, @investment_finalization)
  end

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @investment_finalization = InvestmentFinalization.find(params[:investment_finalization_id])
    @investment_finalization.subscription_agreement.completed
    redirect_to campaign_investment_finalization_path(@campaign, @investment_finalization), :flash => {:success => 'Item completed.'}
  end

  def show
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @investment_finalization = InvestmentFinalization.find(params[:investment_finalization_id])
    @subscription_agreement = @investment_finalization.subscription_agreement
  end
end

