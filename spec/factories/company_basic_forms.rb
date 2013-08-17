FactoryGirl.define do
  factory :category do
    name Faker::Lorem.word
  end
end
FactoryGirl.define do
  factory :industry do
    name Faker::Lorem.word
  end
end

FactoryGirl.define do
  factory :company_basic_form do
    name                Faker::Lorem.sentence(3)
    logo_url            Faker::Internet.url
    founded_on          5.years.ago
    url                 Faker::Internet.url
    ownership_structure 'Corporation'
    category_id         (Category.first.try(:id) || FactoryGirl.create(:category).id)
    industry_id         (Industry.first.try(:id) || FactoryGirl.create(:industry).id)
    summary             Faker::Lorem.sentence(20)
    address_1           Faker::Address.street_address
    address_2           Faker::Address.secondary_address
    city                Faker::Address.city
    state               Faker::Address.state_abbr
    zip                 Faker::Address.zip_code
    phone               Faker::PhoneNumber.phone_number
  end
end
