FactoryGirl.define do
  factory :category do
    name "Category #{Faker::Lorem.word}"
  end
end

FactoryGirl.define do
  factory :company do
    company_name          "#{Faker::Company.name}"
    logo_url              "http://placehold.it/100x100&text=Logo"
    short_description     Faker::Company.catch_phrase
    company_url           Faker::Internet.url
    campaign_title        "Campaign title #{Faker::Lorem.sentence}"
    company_highlights    "Company highlights #{Faker::Lorem.sentence(20)}"
    company_details       "Company details #{Faker::Lorem.sentence}"
    founded_on_year       5.years.ago.year
    ownership_structure   'Corporation'
    category_id           (Category.first.try(:id) || FactoryGirl.create(:category).id)
    address_1             Faker::Address.street_address
    address_2             Faker::Address.secondary_address
    city                  Faker::Address.city
    state                 Faker::Address.state_abbr
    zip                   Faker::Address.zip_code
    phone                 Faker::PhoneNumber.phone_number
    faq                   "FAQ #{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)}"
    video_url             'http://www.youtube.com/embed/OQSNhk5ICTI'
    photo_url             'http://placehold.it/100x100'
    #banner_photo_url      "http://placehold.it/1500x400.gif&text=Company%20Banner"
    banner_photo_url      "http://placehold.it/930x400.gif&text=Company%20Banner"
  end
end
