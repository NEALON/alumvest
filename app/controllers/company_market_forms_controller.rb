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
  
  def show
    @cmf = CompanyMarketForm.find(params[:id])
  end
end
