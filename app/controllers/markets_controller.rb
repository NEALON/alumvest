class MarketsController < ApplicationController

  before_filter :load_market, :except => [:new, :create]

  def new
    @company = Company.find(params[:company_id])
    @market = Market.new(:company => @company)
  end

  def create
    @market = Market.create(params[:market])
    if @market.valid?
      redirect_to company_market_path(@market.company), :notice => 'Company market info saved.'
    else
      render :action => :new
    end
  end

  def edit
    render :new
  end

  def update
    @market.update_attributes(params[:market])
    if @market.valid?
      redirect_to company_market_path(@market.company), :notice => 'Company market info saved.'
    else
      render :edit
    end
  end
  
  def submit_for_review
    @market.update_attributes(params[:market])
    if @market.make_ready_for_review
      redirect_to company_market_path(@market.company), :notice => 'Company market info is ready for review.'
    else
      render :new, :error => 'Correct the data to make this ready for review.' # because we use it for both new and edit
    end
  end
  
  def show
    true
  end

  private

  def load_market
    @company = Company.find(params[:company_id])
    @market = @company.market
  end
end
