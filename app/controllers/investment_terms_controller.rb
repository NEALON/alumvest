class InvestmentTermsController < ApplicationController

  before_filter :load_investment_term, :except => [:new, :create]

  def new
    @campaign = CampaignBase.find(params[:campaign_id])
    @investment_term = Alumvest::InvestmentTerm::Base.new(:campaign => @campaign)
    @investment_term.subscription_docs.build
    @investment_term.other_docs.build
  end

  def create
    @campaign = CampaignBase.find(params[:alumvest_investment_term_base][:campaign_id])
    @investment_term = Alumvest::InvestmentTerm::Base.create(add_images_if_test!(params[:alumvest_investment_term_base]))
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
    @investment_term.update_attributes(params[:alumvest_investment_term_base])
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
      @investment_term.subscription_docs.build if @investment_term.subscription_docs.blank?
      @investment_term.other_docs.build if @investment_term.other_docs.blank?
      render :new, :flash => {:warning => 'Correct the data to make this complete.'}
    end
  end

  def preview
    @disable_nav = true
    @is_preview = true
    render 'display'
  end

  def show; end

  def display; end

  private

  def load_investment_term
    @campaign = CampaignBase.find(params[:campaign_id])
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
