FactoryGirl.define do
  factory :bancbox_investor, :class => Bancbox::Investor do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    phone Faker::Number.number(10)
    email Faker::Internet.email
    address_1 Faker::Address.street_address
    city Faker::Address.city
    state Faker::Address.state_abbr
    zip Faker::Address.zip_code
    agreement true
    investor_type "Individual/LLC"
  end
end
