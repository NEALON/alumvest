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

  def submit_for_review
    @cbf = CompanyBasicForm.find(params[:company_basic_form_id])
    @cbf.update_attributes(params[:company_basic_form])
    if @cbf.make_ready_for_review
      redirect_to @cbf, :notice => 'Company demographic info is ready for review.'
    else
      render :new, :error => 'Correct the data to make this ready for review.' # because we use it for both new and edit
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

