module Features
  module WorkflowStepHelpers
    def create_new_company
      visit new_company_path
      fill_in_company
    end

    def create_blank_new_company
      visit new_company_path
      click_button 'Save changes'
    end

    def create_new_investment_term
      visit new_investment_term_path
      fill_in_investment_term
    end

    def create_blank_new_investment_term
      visit new_investment_term_path
      click_button 'Save changes'
    end

    def create_new_company_market_form
      visit new_company_market_form_path
      fill_in_company_market_form
    end

    def create_blank_new_company_market_form
      visit new_company_market_form_path
      click_button 'Save changes'
    end

    def create_new_team
      visit new_team_path
      fill_in_team
    end

    def create_blank_new_team
      visit new_team_path
      click_button 'Save changes'
    end

    def create_personnel_form_via_factories(company_worksheet = nil)
      team = FactoryGirl.create(:team, :company_worksheet => company_worksheet)
      team.legal_counsel << FactoryGirl.create(:legal_counsel)
      team.founders << FactoryGirl.create(:founder)
      team.team_members << FactoryGirl.create(:team_member)
      team.board_members << FactoryGirl.create(:board_member)
      team.advisors << FactoryGirl.create(:advisor)
      team
    end
  end
end
