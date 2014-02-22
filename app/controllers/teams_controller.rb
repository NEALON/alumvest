class TeamsController < ApplicationController

  before_filter :load_team, :except => [:new, :create]

  def new
    @campaign = CampaignBase.find(params[:campaign_id])
    @team = Alumvest::Team::Base.new(:campaign => @campaign)
    @team.team_members.build
  end

  def create
    @team = Alumvest::Team::Base.create(params[:alumvest_team_base])
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
    @team.update_attributes(params[:alumvest_team_base])
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
      @team.team_members.build if @team.team_members.blank?
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
    @campaign = CampaignBase.find(params[:campaign_id])
    @company = @campaign.company
    @team = @campaign.team
  end
end
