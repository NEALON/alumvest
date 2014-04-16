class InvestmentsController < ApplicationController

  before_filter :load_campaign_and_company

  def new
    @investment = InvestmentBase.new(:campaign => @campaign, :investor => current_user.investor)
    @workflow = InvestmentWorkflow.new(@investment)
    render :layout => 'investments'
  end

  def edit
    @investment = InvestmentBase.find(params[:id])
    @workflow = InvestmentWorkflow.new(@investment)
    render :layout => 'investments'
  end

  def update
    @investment = InvestmentBase.find(params[:id])
    @investment.update_attributes(params[:alumvest_investment_base])
    @workflow = InvestmentWorkflow.new(@investment)
    if @investment.valid?
      redirect_to campaign_investment_path(@campaign, @investment), :flash => {:success => 'Investment amount saved.' }
    else
      render :new, :layout => 'investments'
    end
  end

  def create
    @investment = InvestmentBase.create(params[:alumvest_investment_base])
    @workflow = InvestmentWorkflow.new(@investment)
    if @investment.valid?
      Bus::Event::InvestmentInitiated.create(
          :campaign => @campaign,
          :investment => @investment,
          :investor => @investment.investor
      )

      redirect_to campaign_investment_path(@campaign, @investment), :flash => {:success => 'Investment amount saved.' }
    else
      render :new, :layout => 'investments'
    end
  end

  def show
    @investment = InvestmentBase.find(params[:id])
    @workflow = InvestmentWorkflow.new(@investment)
    render :layout => 'investments'
  end

  def investor_verification
    @investment = InvestmentBase.find(params[:investment_id])
    @workflow = InvestmentWorkflow.new(@investment)
    render :layout => 'investments'
  end

  def submit_for_review
    @investment = InvestmentBase.find(params[:investment_id])
    @investment.finalize
    redirect_to display_campaign_company_path(@campaign), :flash => {:success => "Thank you for your investment!"}
  end

  def payment_type
    @investment = InvestmentBase.find(params[:investment_id])
    @workflow = InvestmentWorkflow.new(@investment)
    render :layout => 'investments'
  end

  def update_payment_type
    @campaign = CampaignBase.find(params[:campaign_id])
    @investment = InvestmentBase.find(params[:investment_id])
    @investment.update_attributes(:payment_type => params[:payment_type])
    redirect_to new_campaign_investment_online_payment_path(@campaign, @investment), :flash => {:success => "You have opted for online payment."}
  end

  private

  def load_campaign_and_company
    @campaign = CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    @is_accredited = current_user.investor.is_accredited?
  end
end