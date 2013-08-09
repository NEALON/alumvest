# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :investor do
    ssn "MyString"
    marital_status "MyString"
    financial_info "MyText"
    spending_habits "MyText"
    income "MyString"
    income_type "MyString"
    net_worth "MyString"
    investor_representations "MyString"
    industry "MyString"
    company "MyString"
    job_title "MyString"
    experience "MyString"
    expertise "MyString"
    accredited_investor_status "MyString"
    personal_message "MyText"
    user nil
  end
end
