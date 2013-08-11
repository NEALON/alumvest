class CompanyFundingDocFormsController < ApplicationController
  def new
    @cfdf = CompanyFundingDocForm.new(:company_worksheet_id => current_user.owner.company_worksheet.id)
  end

  def create
    @cfdf = CompanyFundingDocForm.create(params[:company_funding_doc_form])
    if @cfdf.valid?
      redirect_to @cfdf, :notice => 'Company funding doc info saved.'
    else
      render :action => :new
    end
  end

  def show
    @cfdf = CompanyFundingDocForm.find(params[:id])
  end
end
