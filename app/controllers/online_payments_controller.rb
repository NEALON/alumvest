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
      redirect_to campaign_investment_path(@campaign.id, @investment.id), :flash => {:success => 'Account information for online payment saved.' }
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
    if params[:payment_type] == 'wire'
          redirect_to :action => :new
          return
    end
    if @payment
      render :layout => 'investments'
    else
       redirect_to :action => :new
    end
  end
  
  def wire_instructions
     @investment = Alumvest::InvestmentBase.find(params[:investment_id])
     @campaign = Alumvest::CampaignBase.find(params[:campaign_id])
     if !@investment.investor.bancbox_investor #Create new BancBox Investor
       TalksToBancbox.submit_investor!(@investment.investor.user, @bank_account)
     end
  end
end