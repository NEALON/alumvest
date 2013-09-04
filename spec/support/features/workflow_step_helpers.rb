module Features
  module WorkflowStepHelpers
    def create_new_company
      visit new_company_path
      fill_in_company
      Company.last
    end

    def create_blank_new_company
      visit new_company_path
      click_button 'Save changes'
    end

    def create_new_investment_term(company)
      visit new_company_investment_term_path company
      fill_in_investment_term company
      InvestmentTerm.last
    end

    def create_blank_new_investment_term(company)
      visit new_company_investment_term_path company
      click_button 'Save changes'
    end

    def create_new_team(company)
      visit new_company_team_path company
      fill_in_team company
      Team.last
    end

    def create_blank_new_team(company)
      visit new_company_team_path(company)
      click_button 'Save changes'
    end

    def create_new_update(company)
      visit new_company_update_path company
      fill_in_update company
      Update.last
    end

    def create_blank_new_update(company)
      visit new_company_update_path company
      click_button 'Save changes'
    end
    
    def create_team_via_factories(company, build_or_create = :build)
      team = FactoryGirl.send(build_or_create, :team, :company => company)
      team.team_members << FactoryGirl.create(:team_member)
      team
    end
  end
end
