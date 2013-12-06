class FundingLevelsController < ApplicationController

  def edit
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @investment = Investment.find(params[:investment_id])
    unless @investment.funding_level
      @investment.funding_level = FundingLevel.create(:investment => @investment, :amount => 0)
    end
    @funding_level = @investment.funding_level
    render :layout => 'investment_finalizers'
  end

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @investment = Investment.find(params[:investment_id])
    @investment.funding_level.update_attributes(params[:funding_level])
    if @investment.valid?
      @investment.funding_level.complete
      redirect_to campaign_investment_path(@campaign, @investment), :flash => {:success => 'Item completed.'}
    else
      render :edit
    end
  end
end

