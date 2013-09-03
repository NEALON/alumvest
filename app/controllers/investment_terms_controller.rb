class InvestmentTermsController < ApplicationController

  before_filter :load_investment_term, :except => [:new, :create]

  def new
    @company = Company.find(params[:company_id])
    @investment_term = InvestmentTerm.new(:company => @company)
    @investment_term.subscription_docs.build
    @investment_term.other_docs.build
  end

  def create
    @investment_term = InvestmentTerm.create(add_images_if_test!(params[:investment_term]))
    if @investment_term.valid?
      redirect_to company_investment_term_path(@investment_term.company), :notice => 'Company investment terms saved.'
    else
      render :action => :new
    end
  end

  def edit
    render :new
  end

  def update
    @investment_term.update_attributes(params[:investment_term])
    if @investment_term.valid?
      redirect_to company_investment_term_path(@investment_term.company), :notice => 'Company investment terms saved.'
    else
      render :edit
    end
  end
  
  def check_for_completeness
    @investment_term.update_attributes(params[:investment_term])
    if @investment_term.make_ready_for_review
      redirect_to company_investment_term_path(@investment_term.company), :notice => 'Company investment terms are complete.'
    else
      render :new, :error => 'Correct the data to make this complete.' # because we use it for both new and edit
    end
  end

  def show
  end

  private

  def load_investment_term
    @company = Company.find(params[:company_id])
    @investment_term = @company.investment_term
  end

  def add_images_if_test!(params)
    if Rails.env.test?
      params[:business_plan_url] = 'http://placehold.it/30x30'
      params[:financial_statement_url] = 'http://placehold.it/30x30'
      params[:term_sheet_url] = 'http://placehold.it/30x30'
      params
    else
      params
    end
  end
end