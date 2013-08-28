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

    def create_new_investment_term(company)
      visit new_company_investment_term_path company
      fill_in_investment_term company
    end

    def create_blank_new_investment_term(company)
      visit new_company_investment_term_path company
      click_button 'Save changes'
    end

    def create_new_market(company)
      visit new_company_market_path company
      fill_in_market company
    end

    def create_blank_new_market(company)
      visit new_company_market_path company
      click_button 'Save changes'
    end

    def create_new_team(company)
      visit new_company_team_path company
      fill_in_team company
    end

    def create_blank_new_team(company)
      visit new_company_team_path(company)
      click_button 'Save changes'
    end

    def create_team_via_factories(company, build_or_create = :build)
      team = FactoryGirl.send(build_or_create, :team, :company => company)
      team.legal_counsel << FactoryGirl.create(:legal_counsel)
      team.founders << FactoryGirl.create(:founder)
      team.team_members << FactoryGirl.create(:team_member)
      team.board_members << FactoryGirl.create(:board_member)
      team.advisors << FactoryGirl.create(:advisor)
      team
    end
  end
end
