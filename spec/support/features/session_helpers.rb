module Features
  module SessionHelpers
    def sign_up(
        role = :issuer,
            first_name = Faker::Name.first_name || 'Mike',
            last_name = Faker::Name.last_name,
            email = Faker::Internet.email,
            password = Faker::Internet.password)

      @first_name, @last_name, @email, @password = first_name, last_name, email, password
      visit '/'
      click_link 'Register'
      fill_in 'first_name', :with => first_name
      fill_in 'last_name', :with => last_name
      fill_in 'email', :with => email
      fill_in 'password', :with => password
      fill_in 'password_confirmation', :with => password

      case role
        when :issuer, :admin
          choose 'issuer'
        when :investor
          choose 'investor'
      end

      click_button 'Signup'
      @user = Alumvest::UserBase.last
      @issuer = @user.issuer
      @investor = @user.investor

      @user.update_attribute(:user_type, 'admin') if role == :admin
    end

    def sign_out
      click_link 'user-name'
      click_link 'Sign out'
    end

    def sign_in(email = @email, password = @password)
      visit '/'
      click_link 'Login'
      within '#login-modal' do
        fill_in 'Email', :with => email
        fill_in 'password', :with => password
        click_button 'Login'
      end
    end
  end
end
