class IrsDocGroupsController < ApplicationController

  def new
    @campaign = Alumvest::Campaign::Base.find(params[:campaign_id])
    @investment = Alumvest::Investment::Base.find(params[:investment_id])
    unless @investment.irs_doc_group
      IrsDocGroup.create(:investment => @investment)
    end
    redirect_to campaign_investment_irs_doc_group_path(@campaign, @investment)
  end

  def update
    @campaign = Alumvest::Campaign::Base.find(params[:campaign_id])
    @investment = Alumvest::Investment::Base.find(params[:investment_id])
    @investment.irs_doc_group.complete
    redirect_to campaign_investment_path(@campaign, @investment), :flash => {:success => 'Item completed.'}
  end

  def show
    @campaign = Alumvest::Campaign::Base.find(params[:campaign_id])
    @company = @campaign.company
    @investment = Alumvest::Investment::Base.find(params[:investment_id])
    @irs_doc_group = @investment.irs_doc_group
    render :layout => 'investment_finalizers'
  end
end

