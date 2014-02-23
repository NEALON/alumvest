class ContractDocGroupsController < ApplicationController

  def new
    @campaign = CampaignBase.find(params[:campaign_id])
    @investment = InvestmentBase.find(params[:investment_id])
    unless @investment.contract_doc_group
      ContractDocGroup.create(:investment => @investment)
    end
    redirect_to campaign_investment_contract_doc_group_path(@campaign, @investment)
  end

  def update
    @campaign = CampaignBase.find(params[:campaign_id])
    @investment = InvestmentBase.find(params[:investment_id])
    @investment.contract_doc_group.complete
    redirect_to campaign_investment_path(@campaign, @investment), :flash => {:success => 'Item completed.'}
  end

  def show
    @campaign = CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    @investment = InvestmentBase.find(params[:investment_id])
    @workflow = InvestmentWorkflow.new(@investment)
    @contract_doc_group = @investment.contract_doc_group

    @campaign.investment_term.make_signable_document_envelopes(@investment) &&
        @investment.reload if @investment.signings.blank?

    @signings = @investment.signings

    render :layout => 'investments'
  end
end