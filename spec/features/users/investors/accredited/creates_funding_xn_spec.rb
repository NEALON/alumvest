require 'spec_helper'

describe 'accredited investor creates funding xn', :type => :feature do

  before :each do
    create_funded_investment
  end

  it 'creates a new funding xn' do
    expect(page).to have_content('Your ACH payment has been initiated.')
  end
end