require 'spec_helper'

describe 'investor', :type => :feature do

  before :each do
    sign_up :investor
    @investor.update_attribute :accredited_investor_status, 'approved'
    fill_in_user_basic_info
  end

  it 'does stuff' do
  end
end