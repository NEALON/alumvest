require File.dirname(__FILE__) + '/../spec_helper'

describe "user sessions", :type => :feature do

  it "registers" do
    sign_up_with 'Mike Pence', 'mike.pence@gmail.com', 'secret1234'
    expect(page).to have_content('Signed in!')
  end

  it "signs out" do
    sign_up_with 'Mike Pence', 'mike.pence@gmail.com', 'secret1234'
    signout
    expect(page).to have_content('Signed out!')
  end

  it "signs back in" do
    sign_up_with 'Mike Pence', 'mike.pence@gmail.com', 'secret1234'
    signout
    sign_in_with 'mike.pence@gmail.com', 'secret1234'
    expect(page).to have_content('Signed in!')
  end
end