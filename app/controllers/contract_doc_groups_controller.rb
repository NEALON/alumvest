class ContractDocGroupsController < ApplicationController

  def update
    @campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    @investment = Alumvest::InvestmentBase.find(params[:investment_id])
    authorize! :manage, @investment
    @investment.contract_doc_group.complete
    redirect_to campaign_investment_path(@campaign, @investment), :flash => {:success => 'Item completed.'}
  end

  def show
    @investment = Alumvest::InvestmentBase.find(params[:investment_id])
    authorize! :manage, @investment

    @campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    @workflow = InvestmentWorkflow.new(@investment)

    unless @contract_doc_group = @investment.contract_doc_group
      @contract_doc_group = Alumvest::ContractDocGroup.create(:investment => @investment)
    end
    @contract_doc_group.create_signings_for(@campaign.investment_term.templates)
    @signings = @contract_doc_group.signings

    render :layout => 'investments'
  end
end
