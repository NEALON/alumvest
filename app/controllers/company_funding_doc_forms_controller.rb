class CompanyFundingDocFormsController < ApplicationController
  def new
    @cfdf = CompanyFundingDocForm.new
  end

  def create
    @cfdf = CompanyFundingDocForm.create(params[:company_funding_doc_form])
    if @cfdf.valid?
      render :text => 'ok'
    else
      render :action => :new
    end
  end
end
