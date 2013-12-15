require File.dirname(__FILE__) + '/../spec_helper'

describe 'investor', :type => :feature do

  before :each do
    sign_up :investor
    @investor.update_attribute :accredited_investor_status, 'approved'
    fill_in_user_basic_info
  end

  it 'does stuff' do
    sleep 10
    true
  end

end