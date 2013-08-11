class CompanyBasicFormsController < ApplicationController
  def new
    @cbf = CompanyBasicForm.new(:company_worksheet_id => current_user.owner.company_worksheet.id)
  end

  def create
    @cbf = CompanyBasicForm.create(add_images_if_test!(params[:company_basic_form]))
    if @cbf.valid?
      redirect_to @cbf, :notice => 'Company demographic info saved.'
    else
      render :action => :new
    end
  end

  def edit
    @cbf = CompanyBasicForm.find(params[:id])
    render :new
  end

  def update
    @cbf = CompanyBasicForm.find(params[:id])
    @cbf.update_attributes(params[:company_basic_form])
    if @cbf.valid?
      redirect_to @cbf, :notice => 'Company demographic info saved.'
    else
      render :edit
    end
  end

  def show
    @cbf = CompanyBasicForm.find(params[:id])
  end

  private

  def add_images_if_test!(params)
    if Rails.env.test?
      params[:logo_url] = 'http://placehold.it/30x30'
      params
    else
      params
    end
  end
end

