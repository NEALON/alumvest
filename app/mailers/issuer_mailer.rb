class IssuerMailer < ActionMailer::Base
  default :from => 'admin@alumvest.com'

  def go_live(email)
    @greeting = "Hi"

    mail :to => email
  end

  def reject(email)
    @greeting = "Hi"

    mail :to => email
  end
end
