class SubscriptionAgreementsController < ApplicationController

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @investment = Investment.find(params[:investment_id])
    unless @investment.subscription_agreement
      SubscriptionAgreement.create(:investment => @investment)
    end
    redirect_to campaign_investment_subscription_agreement_path(@campaign, @investment)
  end

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @investment = Investment.find(params[:investment_id])
    @investment.subscription_agreement.complete
    redirect_to campaign_investment_path(@campaign, @investment), :flash => {:success => 'Item completed.'}
  end

  def show
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @investment = Investment.find(params[:investment_id])
    @subscription_agreement = @investment.subscription_agreement
    render :layout => 'investment_finalizers'
  end
end

