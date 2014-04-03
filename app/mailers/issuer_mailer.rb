class IssuerMailer < ActionMailer::Base
  default :from => 'admin@alumvest.com'

  def accept(email)
    @greeting = "Hi"

    mail :to => email
  end

  def reject(email)
    @greeting = "Hi"

    mail :to => email
  end
end
