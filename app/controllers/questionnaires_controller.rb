class QuestionnairesController < ApplicationController

  def edit
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @investment = Investment.find(params[:investment_id])
    unless @investment.questionnaire
      @investment.questionnaire = Questionnaire.create(:investment => @investment)
    end
    @questionnaire = @investment.questionnaire
    render :layout => 'investment_finalizers'
  end

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @investment = Investment.find(params[:investment_id])
    @investment.questionnaire.update_attributes(params[:questionnaire])
    @investment.questionnaire.complete
    redirect_to campaign_investment_path(@campaign, @investment), :flash => {:success => 'Item completed.'}
  end
end

