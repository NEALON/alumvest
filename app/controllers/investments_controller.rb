class InvestmentsController < ApplicationController

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @investment = Investment.new(:campaign => @campaign, :investor => current_user.investor)
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @investment = Investment.create(params[:investment])
    if @investment.valid?
      redirect_to display_campaign_company_path(@campaign), :flash => {:success => 'Campaign investment saved. Thank you!' }
    else
      render :action => :new
    end
  end

  def edit
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @investment = Investment.find(params[:id])

    render :new
  end

  def destroy
    @campaign = Campaign.find(params[:campaign_id])
    investment = Investment.find(params[:id])
    investment.destroy
    redirect_to campaign_company_investments_path(@campaign), :flash => {:success => 'Your investment was deleted.' }
  end
end
