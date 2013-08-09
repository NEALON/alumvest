class CompanyBasicFormsController < ApplicationController
  def new
    @cbf = CompanyBasicForm.new
  end

  def create
    @cbf = CompanyBasicForm.create(params[:company_basic_form])
    if @cbf.valid?
      render :text => 'ok'
    else
      render :action => :new
    end
  end
end
