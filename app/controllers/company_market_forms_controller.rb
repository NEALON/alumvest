class CompanyMarketFormsController < ApplicationController
  def new
    @cmf = CompanyMarketForm.new(:company_worksheet_id => current_user.owner.company_worksheet.id)
  end

  def create
    @cmf = CompanyMarketForm.create(params[:company_market_form])
    if @cmf.valid?
      redirect_to @cmf, :notice => 'Company market info saved.'
    else
      render :action => :new
    end
  end

  def edit
    @cmf = CompanyMarketForm.find(params[:id])
    render :new
  end

  def update
    @cmf = CompanyMarketForm.find(params[:id])
    @cmf.update_attributes(params[:company_market_form])
    if @cmf.valid?
      redirect_to @cmf, :notice => 'Company market info saved.'
    else
      render :edit
    end
  end
  
  def submit_for_review
    @cmf = CompanyMarketForm.find(params[:company_market_form_id])
    @cmf.update_attributes(params[:company_market_form])
    if @cmf.make_ready_for_review
      redirect_to @cmf, :notice => 'Company market info is ready for review.'
    else
      render :new, :error => 'Correct the data to make this ready for review.' # because we use it for both new and edit
    end
  end
  
  def show
    @cmf = CompanyMarketForm.find(params[:id])
  end
end
