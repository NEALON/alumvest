require File.dirname(__FILE__) + '/../../spec_helper'

describe "managing company personnel", :type => :feature do

  before :each do
    sign_up :owner
  end

  it "by creating one" do
    visit new_company_personnel_form_path
    fill_in_company_personnel_form
    expect(page).to have_content('Company people info saved.')
    sleep 10
  end

  it "by editing one" do
    cpf = FactoryGirl.create(:company_personnel_form)
    cpf.legal_counsel << FactoryGirl.create(:legal_counsel)
    cpf.founders << FactoryGirl.create(:founder)
    cpf.team_members << FactoryGirl.create(:team_member)
    cpf.board_members << FactoryGirl.create(:board_member)
    cpf.advisors << FactoryGirl.create(:advisor)

    visit edit_company_personnel_form_path cpf
    fill_in_company_personnel_form
    expect(page).to have_content('Company people info saved.')
  end
end