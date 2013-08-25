FactoryGirl.define do
  factory :company_worksheet do
    company = FactoryGirl.create(:company)
    # team = FactoryGirl.create(:team)
    company_market_form = FactoryGirl.create(:company_market_form)
    # investment_term = FactoryGirl.create(:investment_term)
  end
end
