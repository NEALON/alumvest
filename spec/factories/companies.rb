FactoryGirl.define do
  factory :category do
    name Faker::Lorem.word
  end
end

FactoryGirl.define do
  factory :company do
    company_name          "#{Faker::Company.name}"
    logo_url              Faker::Internet.url
    short_description     Faker::Lorem.word
    url                   Faker::Internet.url
    title                 Faker::Lorem.sentence
    headline              Faker::Company.catch_phrase
    company_introductions Faker::Lorem.sentence
    pitch                 "#{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)}"
    founded_on_year       5.years.ago.year
    ownership_structure   'Corporation'
    category_id           (Category.first.try(:id) || FactoryGirl.create(:category).id)
    address_1             Faker::Address.street_address
    address_2             Faker::Address.secondary_address
    city                  Faker::Address.city
    state                 Faker::Address.state_abbr
    zip                   Faker::Address.zip_code
    phone                 Faker::PhoneNumber.phone_number
    photo_url             'http://placehold.it/100x100'
    video_url             'http://www.youtube.com/embed/OQSNhk5ICTI'
    highlights            Faker::Lorem.sentence(20)
    permalink             Faker::Lorem.word
  end
end
