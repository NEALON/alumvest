class PaymentStep < NavableStep

  def label
    'Payment'
  end

  def checked?
    false
  end

  def enabled?
    @investment.persisted?
  end

  def active?(active_view)
    active_view == 'payment'
  end

  def link
    if @payment
      campaign_investment_online_payment_path(@campaign, @investment)
    else
      new_campaign_investment_online_payment_path(@campaign, @investment)
    end
  end
end
