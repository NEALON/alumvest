class OnlinePaymentsController < ApplicationController

  def new
    @campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    @investment = Alumvest::InvestmentBase.find(params[:investment_id])
    @workflow = InvestmentWorkflow.new(@investment)
    authorize! :manage, @investment
    @payment = Alumvest::OnlinePaymentBase.new(:investment => @investment)
    render :layout => 'investments'
  end

  def create
    @campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    @investment = Alumvest::InvestmentBase.find(params[:investment_id])
    @workflow = InvestmentWorkflow.new(@investment)
    authorize! :manage, @investment
    @payment = Alumvest::OnlinePaymentBase.create(params[:alumvest_online_payment_base])

    if @payment.valid?
      redirect_to campaign_investment_online_payment_path(@campaign, @investment), :flash => {:success => 'Account information for online payment saved.' }
    else
      render :action => :new, :layout => 'investments'
    end
  end

  def edit
    @campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    @investment = Alumvest::InvestmentBase.find(params[:investment_id])
    @workflow = InvestmentWorkflow.new(@investment)
    @payment = @investment.online_payment
    authorize! :manage, @investment
    render 'new', :layout => 'investments'
  end

  def update
    @campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    @investment = Alumvest::InvestmentBase.find(params[:investment_id])
    @workflow = InvestmentWorkflow.new(@investment)
    @payment = @investment.online_payment
    authorize! :manage, @investment
    @payment.update_attributes(params[:alumvest_online_payment_base])
    if @payment.valid?
      redirect_to campaign_investment_online_payment_path(@campaign, @investment), :flash => {:success => 'Account information for online payment saved.' }
    else
      render :action => :edit, :layout => 'investments'
    end
  end

  def show
    @campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    @investment = Alumvest::InvestmentBase.find(params[:investment_id])
    @workflow = InvestmentWorkflow.new(@investment)
    authorize! :manage, @investment
    @payment = @investment.online_payment
    render :layout => 'investments'
  end
end