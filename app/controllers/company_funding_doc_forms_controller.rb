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

