class FundingLevelsController < ApplicationController

  def edit
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @investment_finalization = InvestmentFinalization.find(params[:investment_finalization_id])
    unless @investment_finalization.funding_level
      @investment_finalization.funding_level = FundingLevel.create(:investment_finalization => @investment_finalization)
    end
    @funding_level = @investment_finalization.funding_level
    render :layout => 'investment_finalizers'
  end

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @investment_finalization = InvestmentFinalization.find(params[:investment_finalization_id])
    @investment_finalization.funding_level.update_attributes(params[:funding_level])
    @investment_finalization.funding_level.complete
    redirect_to campaign_investment_finalization_path(@campaign, @investment_finalization), :flash => {:success => 'Item completed.'}
  end
end

