class UserMailer < ActionMailer::Base
  default :from => "Alumvest <info@alumvest.com>"

  def welcome_email(user)
    if false
      @user = user
      attachments.inline['logo.png'] = File.read('public/images/email/logo.png')
      attachments.inline['facebook.png'] = File.read('public/images/email/fb-icon.png')
      attachments.inline['twitter.png'] = File.read('public/images/email/twt-icon.png')
      mail(:to => @user.email, :subject => 'Welcome to AlumVest')
    end
  end
end