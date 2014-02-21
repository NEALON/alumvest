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
    '#'
    # payment_link(@campaign, @investment)
  end
end
