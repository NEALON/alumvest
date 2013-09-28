class QuestionnairesController < ApplicationController

  def edit
    @campaign = Campaign.find(params[:campaign_id])
    @company = @campaign.company
    @investment_finalization = InvestmentFinalization.find(params[:investment_finalization_id])
    unless @investment_finalization.questionnaire
      @investment_finalization.questionnaire = Questionnaire.create(:investment_finalization => @investment_finalization)
    end
    @questionnaire = @investment_finalization.questionnaire
  end

  def update
    @campaign = Campaign.find(params[:campaign_id])
    @investment_finalization = InvestmentFinalization.find(params[:investment_finalization_id])
    @investment_finalization.questionnaire.update_attributes(params[:questionnaire])
    @investment_finalization.questionnaire.complete
    redirect_to campaign_investment_finalization_path(@campaign, @investment_finalization), :flash => {:success => 'Item completed.'}
  end
end

