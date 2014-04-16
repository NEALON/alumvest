module Features
  module WorkflowStepHelpers
    def create_new_company(campaign)
      visit new_campaign_company_path(campaign)
      fill_in_company campaign
    end

    def create_blank_new_company(campaign)
      visit new_campaign_company_path(campaign)
      click_button 'Save'
    end

    def edit_company(campaign)
      visit edit_campaign_company_path(campaign)
      fill_in_company campaign
    end

    def create_new_investment_term(campaign)
      visit new_campaign_investment_term_path campaign
      fill_in_investment_term campaign
      Alumvest::InvestmentTerm::Base.last
    end

    def create_blank_new_investment_term(campaign)
      visit new_campaign_investment_term_path campaign
      click_button 'Save'
    end

    def create_new_team(campaign)
      visit new_campaign_team_path campaign
      fill_in_team campaign
      Alumvest::Team::Base.last
    end

    def create_blank_new_team(campaign)
      visit new_campaign_team_path(campaign)
      click_button 'Save'
    end

    def create_new_job(company)
      visit new_campaign_company_job_path company.campaign
      fill_in_job company
      Alumvest::Job.last
    end

    def create_new_update(company)
      visit new_campaign_company_update_path company.campaign
      fill_in_update company
      Alumvest::Update.last
    end

    def create_blank_new_update(campaign)
      visit new_campaign_company_update_path campaign
      click_button 'Save'
    end
    
    def create_investment_amount(amount = 99.99)
      visit display_campaign_company_path(@campaign)
      click_on 'Invest Now'
      fill_in_investment_amount amount
    end

    def create_funded_investment
      @issuer = create_issuer.issuer
      @campaign = create_live_campaign(@user.issuer)
      create_accredited_investor

      sign_in 'investor@alumvest.com', 'secret'
      @investment = create_investment(@campaign, @user.investor)
      @payment = FactoryGirl.create(:online_payment, :investment => @investment)

      visit campaign_investment_online_payment_path(@campaign, @investment)
      click_on 'Initiate ACH Transfer'
    end
  end
end
