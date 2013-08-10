class CompanyPersonnelFormsController < ApplicationController
  def new
    @cpf = CompanyPersonnelForm.new
    @cpf.founders.build
    @cpf.team_members.build
    @cpf.board_members.build
    @cpf.advisors.build
  end

  def create
    @cpf = CompanyPersonnelForm.create(params[:company_personnel_form])
    if @cpf.valid?
      render :text => 'ok'
    else
      render :action => :new
    end
  end
end
