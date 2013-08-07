module Features
  module SessionHelpers
    def sign_up(
        name = Faker::Name.first_name,
            email = Faker::Internet.email,
            password = Faker::Internet.password)

      @name, @email, @password = name, email, password
      visit '/'
      click_link "Register"
      fill_in 'name', :with => name
      fill_in 'email', :with => email
      fill_in 'password', :with => password
      fill_in 'password_confirmation', :with => password
      click_button 'Register'
    end

    def signout
      click_link "Sign out"
    end

    def sign_in(email = @email, password = @password)
      visit '/'
      click_link 'Login'
      fill_in 'Email', :with => email
      fill_in 'password', :with => password
      click_button 'Login'
    end
  end
end