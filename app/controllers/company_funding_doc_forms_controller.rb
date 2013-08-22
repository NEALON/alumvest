class CompanyFundingDocFormsController < ApplicationController
  def new
    @cfdf = CompanyFundingDocForm.new(:company_worksheet_id => current_user.owner.company_worksheet.id)
  end

  def create
    @cfdf = CompanyFundingDocForm.create(add_images_if_test!(params[:company_funding_doc_form]))
    if @cfdf.valid?
      redirect_to @cfdf, :notice => 'Company funding doc info saved.'
    else
      render :action => :new
    end
  end

  def edit
    @cfdf = CompanyFundingDocForm.find(params[:id])
    render :new
  end

  def update
    @cfdf = CompanyFundingDocForm.find(params[:id])
    @cfdf.update_attributes(params[:company_funding_doc_form])
    if @cfdf.valid?
      redirect_to @cfdf, :notice => 'Company funding doc info saved.'
    else
      render :edit
    end
  end
  
  def submit_for_review
    @cfdf = CompanyFundingDocForm.find(params[:company_funding_doc_form_id])
    @cfdf.update_attributes(params[:company_funding_doc_form])
    if @cfdf.make_ready_for_review
      redirect_to @cfdf, :notice => 'Company funding doc info is ready for review.'
    else
      render :new, :error => 'Correct the data to make this ready for review.' # because we use it for both new and edit
    end
  end

  def show
    @cfdf = CompanyFundingDocForm.find(params[:id])
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

