FactoryGirl.define do
  factory :user, :class => Alumvest::User::Base do
    first_name Faker::Name.first_name
    last_name  Faker::Name.last_name
    gender 'Male'
    mobile_phone '999-999-9999'
    home_phone  '999-999-9999'
    address_1 Faker::Address.street_address
    city Faker::Address.city
    state Faker::Address.state_abbr
    zipcode '18901'
    email Faker::Internet.email
  end
end
