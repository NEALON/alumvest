class CompaniesController < ApplicationController
  def new
    @company = Company.new(:owner => current_user.owner)
  end

  def create
    @company = Company.create(add_images_if_test!(params[:company]))
    if @company.valid?
      redirect_to @company, :notice => 'Company saved.'
    else
      render :action => :new
    end
  end

  def edit
    @company = Company.find(params[:id])
    render :new
  end

  def update
    @company = Company.find(params[:id])
    @company.update_attributes(params[:company])
    if @company.valid?
      redirect_to @company, :notice => 'Company saved.'
    else
      render :edit
    end
  end

  def submit_for_review
    @company = Company.find(params[:company_id])
    @company.update_attributes(params[:company])
    if @company.make_ready_for_review
      redirect_to @company, :notice => 'Company info is ready for review.'
    else
      render :new, :error => 'Correct the data to make this ready for review.' # because we use it for both new and edit
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  private

  def add_images_if_test!(params)
    if Rails.env.test?
      params[:logo_url] = 'http://placehold.it/30x30'
      params[:photo_url] = 'http://placehold.it/30x30'
      params[:banner_photo_url] = 'http://placehold.it/30x30'

      params
    else
      params
    end
  end
end
