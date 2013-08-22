class CompanyPersonnelFormsController < ApplicationController

  def new
    @cpf = CompanyPersonnelForm.new(:company_worksheet_id => current_user.owner.company_worksheet.id)

    @cpf.legal_counsel.build
    @cpf.founders.build
    @cpf.team_members.build
    @cpf.board_members.build
    @cpf.advisors.build
  end

  def create
    # remove empties
    @cpf = CompanyPersonnelForm.create(params[:company_personnel_form])
    if @cpf.valid?
      redirect_to @cpf, :notice => 'Company people info saved.'
    else
      render :action => :new
    end
  end
  
  def edit
    @cpf = CompanyPersonnelForm.find(params[:id])
    render :new
  end

  def update
    @cpf = CompanyPersonnelForm.find(params[:id])
    @cpf.update_attributes(params[:company_personnel_form])
    if @cpf.valid?
      redirect_to @cpf, :notice => 'Company people info saved.'
    else
      render :edit
    end
  end  

  def submit_for_review
    @cpf = CompanyPersonnelForm.find(params[:company_personnel_form_id])
    @cpf.update_attributes(params[:company_personnel_form])
    if @cpf.make_ready_for_review
      redirect_to @cpf, :notice => 'Company personnel info is ready for review.'
    else
      render :new, :error => 'Correct the data to make this ready for review.' # because we use it for both new and edit
    end
  end
  
  def show
    @cpf = CompanyPersonnelForm.find(params[:id])
  end
end
