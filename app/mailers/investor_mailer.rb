class InvestorMailer < ActionMailer::Base
  default :from => 'admin@alumvest.com'

  def veritax_order_status_updated(email)
    @greeting = "Hi"

    mail to: email
  end
end
