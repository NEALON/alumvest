class InvestorMailer < ActionMailer::Base
  default :from => 'admin@alumvest.com'

  def veritax_order_status_updated(email)
    @greeting = "Hi"

    mail :to => email
  end

  def accredited_investor_approved(email)
    @greeting = "Hi"

    mail :to => email
  end

  def accredited_investor_rejected(email)
    @greeting = "Hi"

    mail :to => email
  end
end
