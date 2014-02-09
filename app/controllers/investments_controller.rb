class InvestmentsController < ApplicationController

  def new
    @campaign = Alumvest::Campaign::Base.find(params[:campaign_id])
    @company = @campaign.company
    if current_user and current_user.is_investor?
      investor = current_user.investor

      if investor.invested_in?(@campaign)
        redirect_to campaign_investment_path(@campaign, investor.investments.find_by_campaign_id(@campaign.id))
      else
        @investment = Alumvest::Investment::Base.new(
            :campaign => @campaign,
            :investor => investor)
      end
      render :layout => 'investments'
    else
      redirect_to display_campaign_company_path(@campaign), :flash => {:warning => 'Please sign in to invest!'}
    end
  end

  def create
    @campaign = Alumvest::Campaign::Base.find(params[:campaign_id])
    @company = @campaign.company
    @investment = Alumvest::Investment::Base.create(params[:alumvest_investment_base])
    if @investment.valid?
      redirect_to campaign_investment_path(@campaign, @investment), :flash => {:success => 'Investment amount saved.' }
    else
      render :new
    end
  end

  def show
    @campaign = Alumvest::Campaign::Base.find(params[:campaign_id])
    @company = @campaign.company
    @investment = Alumvest::Investment::Base.find(params[:id])
    render :layout => 'investments'
  end

  def submit_for_review
    @campaign = Alumvest::Campaign::Base.find(params[:campaign_id])
    @company = @campaign.company
    @investment = Alumvest::Investment::Base.find(params[:investment_id])
    @investment.finalize
    redirect_to display_campaign_company_path(@campaign), :flash => {:success => "Thank you for your investment!"}
  end
end