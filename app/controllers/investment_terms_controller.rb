class InvestmentTermsController < ApplicationController

  before_filter :load_investment_term, :except => [:new, :create]

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @investment_term = InvestmentTerm.new(:campaign => @campaign)
    @investment_term.subscription_docs.build
    @investment_term.other_docs.build
  end

  def create
    @campaign = Campaign.find(params[:investment_term][:campaign_id])
    @investment_term = InvestmentTerm.create(add_images_if_test!(params[:investment_term]))
    if @investment_term.valid?
      redirect_to campaign_investment_term_path(@investment_term.campaign), :flash => {:success => 'Campaign investment terms saved.' }
    else
      render :action => :new
    end
  end

  def edit
    @investment_term.subscription_docs.build if @investment_term.subscription_docs.blank?
    @investment_term.other_docs.build if @investment_term.other_docs.blank?

    render :new
  end

  def update
    @investment_term.update_attributes(params[:investment_term])
    if @investment_term.valid?
      redirect_to campaign_investment_term_path(@investment_term.campaign), :flash => {:success => 'Campaign investment terms saved.' }
    else
      render :show
    end
  end

  def check_for_completeness
    if @investment_term.make_ready_for_review
      redirect_to campaign_investment_term_path(@investment_term.campaign), :flash => {:success => 'Campaign investment terms are complete.' }
    else
      render :new, :flash => {:warning => 'Correct the data to make this complete.'}
    end
  end

  def preview
    @disable_nav = true
    render 'display'
  end

  def show; end

  def display; end

  private

  def load_investment_term
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @investment_term = @campaign.investment_term
  end

  def add_images_if_test!(params)
    if Rails.env.test?
      params[:business_plan_url] = '/30x30.gif'
      params[:financial_statement_url] = '/30x30.gif'
      params[:term_sheet_url] = '/30x30.gif'
      params
    else
      params
    end
  end
end
