require 'spec_helper'

describe 'users investor self accredited', :type => :feature do

  before :each do
    sign_up :investor
  end

  it 'handles qualified investor' do
    expect(page).to have_button I18n.t('self-accredited-status.submit')
    fill_in_self_accredited_status(true)
    expect(page).to have_content I18n.t('self-accredited-status.qualified-info')
  end

  it 'handles non-qualified investor' do
    expect(page).to have_button I18n.t('self-accredited-status.submit')
    fill_in_self_accredited_status(false)
    expect(page).to have_content I18n.t('self-accredited-status.non-qualified-info')
  end
end