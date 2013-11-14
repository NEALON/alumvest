# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bancbox_investor do
    name "MyString"
    ssn "MyString"
    investor_type "MyString"
    email "MyString"
    phone "MyString"
    date_of_birth "MyString"
    address_1 "MyString"
    address_2 "MyString"
    city_state_zip "MyString"
  end
end
