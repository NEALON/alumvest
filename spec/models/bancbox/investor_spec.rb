require 'spec_helper_without_capybara'

describe Bancbox::Investor do
  it "can create a bancbox investor" do
    @user = FactoryGirl.create(:user)
    @investor = Bancbox::Investor.create(:user => @user)
  end
end
