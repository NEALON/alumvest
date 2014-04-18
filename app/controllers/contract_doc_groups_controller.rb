class ContractDocGroupsController < ApplicationController

  def new
    @campaign = CampaignBase.find(params[:campaign_id])
    @investment = InvestmentBase.find(params[:investment_id])
    authorize! :manage, @investment
    unless @investment.contract_doc_group
      Alumvest::ContractDocGroup.create(:investment => @investment)
    end
    redirect_to campaign_investment_contract_doc_group_path(@campaign, @investment)
  end

  def update
    @campaign = CampaignBase.find(params[:campaign_id])
    @investment = InvestmentBase.find(params[:investment_id])
    authorize! :manage, @investment
    @investment.contract_doc_group.complete
    redirect_to campaign_investment_path(@campaign, @investment), :flash => {:success => 'Item completed.'}
  end

  def show
    @campaign = CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    @investment = InvestmentBase.find(params[:investment_id])

    authorize! :manage, @investment
    @workflow = InvestmentWorkflow.new(@investment)
    @contract_doc_group = @investment.contract_doc_group

    begin
      raise 'An exception!' if Rails.env.test? && ($TEST_SAYS_DIE_DIE_DIE)

      @campaign.investment_term.make_signable_document_envelopes(@investment)
      @investment.reload
    rescue
      @oy_an_exception_exists = true
      flash[:warning] = 'An exception occurred!'
    end

    @signings = @investment.signings
    render :layout => 'investments'
  end
end
