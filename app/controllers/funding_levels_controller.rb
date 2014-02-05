class FundingLevelsController < ApplicationController

  def edit
    @campaign = Alumvest::Campaign::Base.find(params[:campaign_id])
    @company = @campaign.company
    @investment = Alumvest::Investment::Base.find(params[:investment_id])
    unless @investment.funding_level
      @investment.funding_level = FundingLevel.create(:investment => @investment, :amount => 0)
    end
    @funding_level = @investment.funding_level
    render :layout => 'investment_finalizers'
  end

  def update
    @campaign = Alumvest::Campaign::Base.find(params[:campaign_id])
    @investment = Alumvest::Investment::Base.find(params[:investment_id])
    @funding_level = @investment.funding_level
    @funding_level.update_attributes(params[:alumvest_funding_level])
    if @funding_level.valid?
      @funding_level.complete
      begin
        TalksToBancbox.fund_escrow!(@campaign, @investment, @funding_level.amount)
        redirect_to campaign_investment_path(@campaign, @investment), :flash => {:success => 'Item completed.'}
      rescue Exception => e
        redirect_to campaign_investment_path(@campaign, @investment), :flash => {:warning => e.message}
      end
    else
      @company = @campaign.company
      render :action => :edit, :layout => 'investment_finalizers'
    end
  end
end

