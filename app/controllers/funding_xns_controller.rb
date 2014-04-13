class FundingXnsController < ApplicationController

  def create
    @campaign = CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    @investment = InvestmentBase.find(params[:investment_id])
    @payment = @investment.online_payment
    authorize! :manage, @investment
    @funding_xn = Bancbox::FundingXn.create(:online_payment => @payment)

    if @funding_xn.valid?
      @payment.fund!
      redirect_to campaign_investment_online_payment_path(@campaign, @investment), :flash => {:success => 'Your ACH payment has been initiated.' }
    else
      render :new, :layout => 'investments'
    end
  end
end
