class ContractDocGroupsController < ApplicationController

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @investment_finalization = InvestmentFinalization.find(params[:investment_finalization_id])
    unless @investment_finalization.contract_doc_group
      ContractDocGroup.create(:investment_finalization => @investment_finalization)
    end
    redirect_to campaign_investment_finalization_contract_doc_group_path(@campaign, @investment_finalization)
  end

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @investment_finalization = InvestmentFinalization.find(params[:investment_finalization_id])
    @investment_finalization.contract_doc_group.complete
    redirect_to campaign_investment_finalization_path(@campaign, @investment_finalization), :flash => {:success => 'Item completed.'}
  end

  def show
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @investment_finalization = InvestmentFinalization.find(params[:investment_finalization_id])
    @contract_doc_group = @investment_finalization.contract_doc_group
    @investment_finalization.make_signings && @investment_finalization.reload if @investment_finalization.signings.blank?
    @signings = @investment_finalization.signings
    render :layout => 'investment_finalizers'
  end
end

