class InvestmentWorkflow

  def initialize(investment)
    @investment = investment
    @campaign = investment.campaign
    @steps = [
      AmountStep.new(@investment),
      InvestorVerificationStep.new(@investment),
      PaymentStep.new(@investment),
      SigningStep.new(@investment),
      ReviewStep.new(@investment)
    ]
  end

  def render(active)
    ApplicationController.new.render_cell('tb/investment_workflow_nav', :display, :steps => @steps, :active => active)
  end
end
