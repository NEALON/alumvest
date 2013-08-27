class TeamsController < ApplicationController

  before_filter :load_team, :except => [:new, :create]

  def new
    @company = Company.find(params[:company_id])
    @team = Team.new(:company => @company)

    @team.legal_counsel.build
    @team.founders.build
    @team.team_members.build
    @team.board_members.build
    @team.advisors.build
  end

  def create
    @team = Team.create(params[:team])
    if @team.valid?
      redirect_to company_team_path(@team.company), :notice => 'Company team info saved.'
    else
      render :action => :new
    end
  end
  
  def edit
    render :new
  end

  def update
    @team.update_attributes(params[:team])
    if @team.valid?
      redirect_to company_team_path(@team.company), :notice => 'Company team info saved.'
    else
      render :edit
    end
  end  

  def submit_for_review
    @team.update_attributes(params[:team])
    if @team.make_ready_for_review
      redirect_to company_team_path(@team.company), :notice => 'Team info is ready for review.'
    else
      render :new, :error => 'Correct the data to make this ready for review.' # because we use it for both new and edit
    end
  end
  
  def show
  end

  private

  def load_team
    @company = Company.find(params[:company_id])
    @team = @company.team
  end
end
