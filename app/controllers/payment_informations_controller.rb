class PaymentInformationsController < ApplicationController

  def edit
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @investment_finalization = InvestmentFinalization.find(params[:investment_finalization_id])
    unless @investment_finalization.payment_information
      @investment_finalization.payment_information = PaymentInformation.create(:investment_finalization => @investment_finalization)
    end
    @payment_information = @investment_finalization.payment_information
  end

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @investment_finalization = InvestmentFinalization.find(params[:investment_finalization_id])
    @investment_finalization.payment_information.update_attributes(params[:payment_information])
    @investment_finalization.payment_information.complete
    redirect_to campaign_investment_finalization_path(@campaign, @investment_finalization), :flash => {:success => 'Item completed.'}
  end
end

