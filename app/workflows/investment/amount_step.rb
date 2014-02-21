class AmountStep < NavableStep

  def label
    'Investment'
  end

  def checked?
    @investment.persisted?
  end

  def enabled?
    true # TODO: until they sign or pay
  end

  def active?(active_view)
    active_view == 'investment_amount'
  end

  def link
    if @investment.new_record?
      new_campaign_investment_path(@campaign)
    else
      campaign_investment_path(@campaign, @investment)
    end
  end
end
