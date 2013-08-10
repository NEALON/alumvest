# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :owner do
    ssn "MyString"
    financial_info "MyText"
    experience "MyText"
    expertise "MyText"
    marital_status "MyString"
    personal_message "MyText"
    user nil
  end
end
