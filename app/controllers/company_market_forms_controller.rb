class CompanyMarketFormsController < ApplicationController
  def new
    @cmf = CompanyMarketForm.new
  end

  def create
    @cmf = CompanyMarketForm.create(params[:company_market_form])
    if @cmf.valid?
      render :text => 'ok'
    else
      render :action => :new
    end
  end
end
