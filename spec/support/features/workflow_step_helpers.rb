module Features
  module WorkflowStepHelpers
    def create_new_company_basic_form
      visit new_company_basic_form_path
      fill_in_company_basic_form
    end

    def create_blank_new_company_basic_form
      visit new_company_basic_form_path
      click_button 'Save changes'
    end

    def create_new_company_funding_doc_form
      visit new_company_funding_doc_form_path
      fill_in_company_funding_doc_form
    end

    def create_blank_new_company_funding_doc_form
      visit new_company_funding_doc_form_path
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

    def create_new_company_personnel_form
      visit new_company_personnel_form_path
      fill_in_company_personnel_form
    end

    def create_blank_new_company_personnel_form
      visit new_company_personnel_form_path
      click_button 'Save changes'
    end

    def create_personnel_form_via_factories(company_worksheet = nil)
      cpf = FactoryGirl.create(:company_personnel_form, :company_worksheet => company_worksheet)
      cpf.legal_counsel << FactoryGirl.create(:legal_counsel)
      cpf.founders << FactoryGirl.create(:founder)
      cpf.team_members << FactoryGirl.create(:team_member)
      cpf.board_members << FactoryGirl.create(:board_member)
      cpf.advisors << FactoryGirl.create(:advisor)
      cpf
    end
  end
end
