class InvestorVerificationStep < NavableStep

  def label
    'Investor Verification'
  end

  def checked?
    @investment.investor.is_accredited?
  end

  def enabled?
    @investment.persisted? && ! checked?
  end

  def active?(active_view)
    active_view == 'investor_verification'
  end

  def link
    if @investment.persisted?
      campaign_investment_investor_verification_path(@campaign, @investment)
    else
      '#'
    end
  end
end
