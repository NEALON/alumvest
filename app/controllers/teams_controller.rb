class TeamsController < ApplicationController

  before_filter :load_team, :except => [:new, :create]

  def new
    @campaign = Campaign.find(params[:campaign_id])
    @team = Team.new(:campaign => @campaign)
    @team.team_members.build
  end

  def create
    @team = Team.create(params[:team])
    if @team.valid?
      redirect_to campaign_team_path(@team.campaign), :flash => {:success => 'Campaign team info saved.' }
    else
      render :action => :new
    end
  end

  def edit
    @team.team_members.build if @team.team_members.blank?
    render :new
  end

  def update
    @team.update_attributes(params[:team])
    if @team.valid?
      redirect_to campaign_team_path(@team.campaign), :flash => {:success => 'Campaign team info saved.' }
    else
      render :edit
    end
  end

  def check_for_completeness
    if @team.make_ready_for_review
      redirect_to campaign_team_path(@team.campaign), :flash => {:success => 'Team info is complete.' }
    else
      render :new, :warning => 'Correct the data to make this complete.' # because we use it for both new and edit
    end
  end

  def preview
    @disable_nav = true
    render 'display'
  end

  def show; end

  def display; end

  private

  def load_team
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @team = @campaign.team
  end
end
