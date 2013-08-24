class InvestmentTermsController < ApplicationController
  def new
    @investment_term = InvestmentTerm.new(:company_worksheet_id => current_user.owner.company_worksheet.id)
  end

  def create
    @investment_term = InvestmentTerm.create(add_images_if_test!(params[:investment_term]))
    if @investment_term.valid?
      redirect_to @investment_term, :notice => 'Company investment terms saved.'
    else
      render :action => :new
    end
  end

  def edit
    @investment_term = InvestmentTerm.find(params[:id])
    render :new
  end

  def update
    @investment_term = InvestmentTerm.find(params[:id])
    @investment_term.update_attributes(params[:investment_term])
    if @investment_term.valid?
      redirect_to @investment_term, :notice => 'Company investment terms saved.'
    else
      render :edit
    end
  end
  
  def submit_for_review
    @investment_term = InvestmentTerm.find(params[:investment_term_id])
    @investment_term.update_attributes(params[:investment_term])
    if @investment_term.make_ready_for_review
      redirect_to @investment_term, :notice => 'Company investment terms are ready for review.'
    else
      render :new, :error => 'Correct the data to make this ready for review.' # because we use it for both new and edit
    end
  end

  def show
    @investment_term = InvestmentTerm.find(params[:id])
  end

  private

  def add_images_if_test!(params)
    if Rails.env.test?
      params[:business_plan_url] = 'http://placehold.it/30x30'
      params[:tbd_financial_document_url] = 'http://placehold.it/30x30'
      params[:tbd_funding_document_url] = 'http://placehold.it/30x30'
      params[:tbd_detailed_metrics_document_url] = 'http://placehold.it/30x30'
      params
    else
      params
    end
  end
end