class UpdatesController < ApplicationController

  def index
    @company = Company.find(params[:company_id])
    @update = Update.new(:company => @company)
    @updates = @company.updates
  end

  def new
    @company = Company.find(params[:company_id])
    @update = Update.new(:company => @company)
  end

  def create
    @update = Update.create(params[:update])
    if @update.valid?
      redirect_to company_updates_path(@update.company), :notice => 'Company update saved.'
    else
      render :action => :new
    end
  end

  def edit
    @company = Company.find(params[:company_id])
    @update = Update.find(params[:id])

    render :new
  end

  def update
    @update = Update.find(params[:id])
    @update.update_attributes(params[:update])
    if @update.valid?
      redirect_to company_updates_path(@update.company), :notice => 'Company update saved.'
    else
      render :edit
    end
  end

  def destroy
    update = Update.find(params[:id])
    company = update.company
    update.destroy
    redirect_to company_updates_path(company), :notice => 'Your update was deleted.'
  end
end