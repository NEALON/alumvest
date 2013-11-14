# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bancbox_identity_verification do
    bancbox_status "MyString"
    is_verified false
  end
end
