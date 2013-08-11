class CompanyBasicFormsController < ApplicationController
  def new
    @cbf = CompanyBasicForm.new(:company_worksheet_id => current_user.owner.company_worksheet.id)
  end

  def create
    @cbf = CompanyBasicForm.create(params[:company_basic_form])
    if @cbf.valid?
      redirect_to @cbf, :notice => 'Company demographic info saved.'
    else
      render :action => :new
    end
  end

  def show
    @cbf = CompanyBasicForm.find(params[:id])
  end
end
