require 'spec_helper'

describe "admin", :type => :feature do

  before :each do
    create_owner
    @campaign = create_live_campaign(@user.owner)
    sign_up :admin
  end

  it "should be an admin" do
    expect(User.last.is_admin?).to be_true
  end
end
