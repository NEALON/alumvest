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
    @envelope_workflows = @contract_doc_group.envelope_workflows_from(@campaign.investment_term)

    render :layout => 'investments'
  end
end
