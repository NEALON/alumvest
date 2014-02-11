class FundingXnsController < ApplicationController

  def new
    @campaign = Alumvest::Campaign::Base.find(params[:campaign_id])
    @company = @campaign.company
    @investment = Alumvest::Investment::Base.find(params[:investment_id])
    @funding_xn = Bancbox::FundingXn.new(:investment => @investment, :escrow_id => @campaign.bancbox_escrow.id)
    render :layout => 'investments'
  end

  def create
    @campaign = Alumvest::Campaign::Base.find(params[:campaign_id])
    @company = @campaign.company
    @investment = Alumvest::Investment::Base.find(params[:investment_id])
    @funding_xn = Bancbox::FundingXn.create(params[:bancbox_funding_xn])

    if @funding_xn.valid?
      redirect_to campaign_investment_funding_xn_path(@campaign, @investment, @funding_xn), :flash => {:success => 'Investment amount saved.' }
    else
      render :new
    end
  end

  def show
    @campaign = Alumvest::Campaign::Base.find(params[:campaign_id])
    @company = @campaign.company
    @investment = Alumvest::Investment::Base.find(params[:investment_id])
    @funding_xn = Bancbox::FundingXn.find(params[:id])
    render :layout => 'investments'
  end
end