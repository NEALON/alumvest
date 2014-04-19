class InvestmentsController < ApplicationController

  before_filter :load_campaign_and_company

  def new
    @investment = Alumvest::InvestmentBase.new(:campaign => @campaign, :investor => current_user.investor)
    @workflow = InvestmentWorkflow.new(@investment)
    render :layout => 'investments'
  end

  def edit
    @investment = Alumvest::InvestmentBase.find(params[:id])
    @workflow = InvestmentWorkflow.new(@investment)
    render :layout => 'investments'
  end

  def update
    @investment = Alumvest::InvestmentBase.find(params[:id])
    @investment.update_attributes(params[:alumvest_investment_base])
    @workflow = InvestmentWorkflow.new(@investment)
    if @investment.valid?
      redirect_to campaign_investment_path(@campaign, @investment), :flash => {:success => 'Investment amount saved.' }
    else
      render :new, :layout => 'investments'
    end
  end

  def create
    @investment = Alumvest::InvestmentBase.create(params[:alumvest_investment_base])
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
    @investment = Alumvest::InvestmentBase.find(params[:id])
    @workflow = InvestmentWorkflow.new(@investment)
    render :layout => 'investments'
  end

  def investor_verification
    @investment = Alumvest::InvestmentBase.find(params[:investment_id])
    @workflow = InvestmentWorkflow.new(@investment)
    render :layout => 'investments'
  end

  def submit_for_review
    @investment = Alumvest::InvestmentBase.find(params[:investment_id])
    @investment.finalize
    redirect_to display_campaign_company_path(@campaign), :flash => {:success => "Thank you for your investment!"}
  end

  def payment_type
    @investment = Alumvest::InvestmentBase.find(params[:investment_id])
    @workflow = InvestmentWorkflow.new(@investment)
    render :layout => 'investments'
  end

  def update_payment_type
    @campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    @investment = Alumvest::InvestmentBase.find(params[:investment_id])
    @investment.update_attributes(:payment_type => params[:payment_type])
    redirect_to new_campaign_investment_online_payment_path(@campaign, @investment), :flash => {:success => "You have opted for online payment."}
  end

  private

  def load_campaign_and_company
    @campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    @is_accredited = current_user.investor.is_accredited?
  end
end