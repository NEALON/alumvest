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

  # def create
  #   @campaign = Campaign.find(params[:campaign_id])
  #   @investment_finalization = InvestmentFinalization.create(params[:investment_finalization])
  #   redirect_to campaign_investment_finalization_path(@campaign)
  # end


  # def edit
  #   @campaign = Campaign.find(params[:campaign_id])
  #   @investment_finalization = @campaign.investment_finalization
  #   render :new
  # end

  # def update
  #   @campaign = Campaign.find(params[:campaign_id])
  #   @investment_finalization = @campaign.investment_finalization
  #   @investment_finalization.update_attributes(add_images_if_test!(params[:investment_finalization]))
  #   if @investment_finalization.valid?
  #     redirect_to campaign_investment_finalization_path(@campaign), :flash => {:success => 'Investment finalization saved.' }
  #   else
  #     render :edit
  #   end
  # end
end

