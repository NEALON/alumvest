require File.dirname(__FILE__) + '/../../spec_helper'

describe 'users banking', :type => :feature do

  before :each do
    sign_up :investor
    click_on 'Banking'
  end

  it 'shows' do
    screenshot_and_open_image
  end
end
