FactoryGirl.define do
  factory :company_worksheet do
    company_basic_form = FactoryGirl.create(:company_basic_form)
    company_personnel_form = FactoryGirl.create(:company_basic_form)
    company_market_form = FactoryGirl.create(:company_basic_form)
    investment_term = FactoryGirl.create(:company_basic_form)
  end
end
