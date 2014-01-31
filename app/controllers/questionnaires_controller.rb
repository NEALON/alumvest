class QuestionnairesController < ApplicationController

  def edit
    @campaign = Alumvest::Campaign::Base.find(params[:campaign_id])
    @company = @campaign.company
    @investment = Investment.find(params[:investment_id])
    unless @investment.questionnaire
      @investment.questionnaire = Questionnaire.create(:investment => @investment)
    end
    @questionnaire = @investment.questionnaire
    render :layout => 'investment_finalizers'
  end

  def update
    @campaign = Alumvest::Campaign::Base.find(params[:campaign_id])
    @investment = Investment.find(params[:investment_id])
    @investment.questionnaire.update_attributes(params[:alumvest_questionnaire])
    @investment.questionnaire.complete
    redirect_to campaign_investment_path(@campaign, @investment), :flash => {:success => 'Item completed.'}
  end
end

