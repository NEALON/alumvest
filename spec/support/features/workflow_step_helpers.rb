module Features
  module WorkflowStepHelpers
    def create_new_company(campaign)
      visit new_campaign_company_path(campaign)
      fill_in_company campaign
    end

    def create_blank_new_company(campaign)
      visit new_campaign_company_path(campaign)
      click_button 'Save changes'
    end

    def edit_company(campaign)
      visit edit_campaign_company_path(campaign)
      fill_in_company campaign
    end

    def create_new_investment_term(campaign)
      visit new_campaign_investment_term_path campaign
      fill_in_investment_term campaign
      InvestmentTerm.last
    end

    def create_blank_new_investment_term(campaign)
      visit new_campaign_investment_term_path campaign
      click_button 'Save changes'
    end

    def create_new_team(campaign)
      visit new_campaign_team_path campaign
      fill_in_team campaign
      Team.last
    end

    def create_blank_new_team(campaign)
      visit new_campaign_team_path(campaign)
      click_button 'Save changes'
    end

    def create_new_update(company)
      visit new_campaign_company_update_path company.campaign
      fill_in_update company
      Update.last
    end

    def create_blank_new_update(campaign)
      visit new_campaign_company_update_path campaign
      click_button 'Save changes'
    end
    
    def create_team_via_factories(campaign, build_or_create = :build)
      team = FactoryGirl.send(build_or_create, :team, :campaign => campaign)
      team.team_members << FactoryGirl.create(:team_member)
      team
    end
  end
end
