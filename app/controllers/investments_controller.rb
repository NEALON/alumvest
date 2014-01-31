class InvestmentsController < ApplicationController

  def new
    @campaign = Alumvest::Campaign::Base.find(params[:campaign_id])
    if current_user and current_user.is_investor?
      investor = current_user.investor
      unless (f = investor.investments.find_by_campaign_id(@campaign.id))
        f = Investment.create(:campaign => @campaign, :investor => investor)
      end
      redirect_to [@campaign, f]
    else
      redirect_to display_campaign_company_path(@campaign), :flash => {:warning => "Please sign in as an investor to invest!"}
    end
  end

  def show
    @campaign = Alumvest::Campaign::Base.find(params[:campaign_id])
    @company = @campaign.company
    @investment = Investment.find(params[:id])
  end

  def submit_for_review
    @campaign = Alumvest::Campaign::Base.find(params[:campaign_id])
    @investment = Investment.find(params[:investment_id])
    @investment.finalize
    redirect_to display_campaign_company_path(@campaign), :flash => {:success => "Thank you for your investment!"}
  end
end