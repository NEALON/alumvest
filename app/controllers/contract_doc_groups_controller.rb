class ContractDocGroupsController < ApplicationController

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @investment = Investment.find(params[:investment_id])
    unless @investment.contract_doc_group
      ContractDocGroup.create(:investment => @investment)
    end
    redirect_to campaign_investment_contract_doc_group_path(@campaign, @investment)
  end

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @investment = Investment.find(params[:investment_id])
    @investment.contract_doc_group.complete
    redirect_to campaign_investment_path(@campaign, @investment), :flash => {:success => 'Item completed.'}
  end

  def show
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @investment = Investment.find(params[:investment_id])
    @contract_doc_group = @investment.contract_doc_group
    @investment.make_signings && @investment.reload if @investment.signings.blank?
    @signings = @investment.signings
    render :layout => 'investment_finalizers'
  end
end

