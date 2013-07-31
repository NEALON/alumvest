module Features
  module SessionHelpers
    def sign_up_with(name, email, password)
      visit '/auth/identity/register'
      fill_in 'name', :with => name
      fill_in 'email', :with => email
      fill_in 'password', :with => password
      fill_in 'password_confirmation', :with => password
      click_button 'Connect'
    end

    def signout
      visit '/logout'
    end

    def sign_in_with(email, password)
      visit '/auth/identity'
      fill_in 'Login', :with => email
      fill_in 'password', :with => password
      click_button 'Connect'
    end
  end
end