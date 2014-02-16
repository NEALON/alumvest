class InvestmentsController < ApplicationController

  before_filter :load_campaign_and_company

  def new
    @investment = Alumvest::Investment::Base.new(:campaign => @campaign, :investor => current_user.investor)
    render :layout => 'investments'
  end

  def edit
    @investment = Alumvest::Investment::Base.find(params[:id])
    render :layout => 'investments'
  end

  def update
    @investment = Alumvest::Investment::Base.find(params[:id])
    if @investment.valid?
      redirect_to campaign_investment_path(@campaign, @investment), :flash => {:success => 'Investment amount saved.' }
    else
      render :new
    end
  end

  def create
    @investment = Alumvest::Investment::Base.create(params[:alumvest_investment_base])
    if @investment.valid?
      Bus::Event::InvestmentInitiated.create(
          :campaign => @campaign,
          :investment => @investment,
          :investor => @investment.investor
      )

      redirect_to campaign_investment_path(@campaign, @investment), :flash => {:success => 'Investment amount saved.' }
    else
      render :new
    end
  end

  def show
    @investment = Alumvest::Investment::Base.find(params[:id])
    render :layout => 'investments'
  end

  def investor_verification
    @investment = Alumvest::Investment::Base.find(params[:investment_id])
    render :layout => 'investments'
  end

  def submit_for_review
    @investment = Alumvest::Investment::Base.find(params[:investment_id])
    @investment.finalize
    redirect_to display_campaign_company_path(@campaign), :flash => {:success => "Thank you for your investment!"}
  end

  private

  def load_campaign_and_company
    @campaign = Alumvest::Campaign::Base.find(params[:campaign_id])
    @company = @campaign.company
    @is_accredited = current_user.investor.is_accredited?
  end
end