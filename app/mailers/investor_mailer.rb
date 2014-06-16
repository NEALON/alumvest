class InvestorMailer < ActionMailer::Base
  default :from => 'info@alumvest.com'

  def veritax_order_status_updated(investor)
    @investor = investor
    mail :to => investor.user.email
  end

  def accredited_investor_approved(investor)
    @investor = investor
    mail :to => investor.user.email
  end

  def accredited_investor_rejected(investor)
    @investor = investor
    mail :to => investor.user.email
  end
end
