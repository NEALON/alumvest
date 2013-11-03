require File.dirname(__FILE__) + '/../spec_helper'

describe "admin", :type => :feature do

  before :each do
    @campaign = create_live_campaign
    sign_up :admin
  end

  it "should be an admin" do
    User.last.is_admin?.should be_true

    # screenshot_and_save_page if $do_screenshots
  end
end
