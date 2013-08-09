# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :identity do
    first_name "FirstName"
    last_name "LastName"
    email "MyString"
    password_digest "MyString"
  end
end
