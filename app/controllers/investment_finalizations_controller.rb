class InvestmentFinalizationsController < ApplicationController

  def new
    @campaign = Campaign.find(params[:campaign_id])
    investor = current_user.investor
    unless (f = investor.investment_finalizations.find_by_campaign_id(@campaign.id))
      f = InvestmentFinalization.create(:campaign => @campaign, :investor => investor)
    end
    redirect_to [@campaign, f]
  end


  def show
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @investment_finalization = InvestmentFinalization.find(params[:id])
  end

  def submit_for_review
    @campaign = Campaign.find(params[:campaign_id])
    @investment_finalization = InvestmentFinalization.find(params[:investment_finalization_id])
    @investment_finalization.finalize
    redirect_to display_campaign_company_path(@campaign), :flash => {:success => "Thank you for your investment!"}
  end
end

