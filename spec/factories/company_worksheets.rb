FactoryGirl.define do
  factory :company_worksheet do
    company = FactoryGirl.create(:company)
    # team = FactoryGirl.create(:team)
    # market = FactoryGirl.create(:market)
    # investment_term = FactoryGirl.create(:investment_term)
  end
end
