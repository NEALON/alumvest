class TeamsController < ApplicationController

  def new
    @team = Team.new(:company_worksheet_id => current_user.owner.company_worksheet.id)

    @team.legal_counsel.build
    @team.founders.build
    @team.team_members.build
    @team.board_members.build
    @team.advisors.build
  end

  def create
    @team = Team.create(params[:team])
    if @team.valid?
      redirect_to @team, :notice => 'Company people info saved.'
    else
      render :action => :new
    end
  end
  
  def edit
    @team = Team.find(params[:id])
    render :new
  end

  def update
    @team = Team.find(params[:id])
    @team.update_attributes(params[:team])
    if @team.valid?
      redirect_to @team, :notice => 'Company people info saved.'
    else
      render :edit
    end
  end  

  def submit_for_review
    @team = Team.find(params[:team_id])
    @team.update_attributes(params[:team])
    if @team.make_ready_for_review
      redirect_to @team, :notice => 'Team info is ready for review.'
    else
      render :new, :error => 'Correct the data to make this ready for review.' # because we use it for both new and edit
    end
  end
  
  def show
    @team = Team.find(params[:id])
  end
end
