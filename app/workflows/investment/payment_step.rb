class PaymentStep < NavigableStep

  def label
    'Payment'
  end

  def checked?
    @payment.try(:funded?)
  end

  def enabled?
    @investment.persisted?
  end

  def active?(active_view)
    active_view == 'payment'
  end

  def link
    if @investment.persisted?
      if @investment.payment_type
        if @investment.payment_type == 'online'
          if @payment
            campaign_investment_online_payment_path(@campaign, @investment)
          else
            new_campaign_investment_online_payment_path(@campaign, @investment)
          end
        else
          '#'
        end
      else
        campaign_investment_payment_type_path(@campaign, @investment)
      end
    else
      '#'
    end
  end
end
