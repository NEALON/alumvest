FactoryGirl.define do
  factory :bancbox_issuer, :class => Bancbox::Issuer do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    phone Faker::Number.number(10)
    email Faker::Internet.email
    address_1 Faker::Address.street_address
    city Faker::Address.city
    state Faker::Address.state_abbr
    zip Faker::Address.zip_code
    agreement true
    company_name Faker::Name.first_name
    company_type 'LLC'
    company_registration_state Faker::Address.state_abbr
    company_tax_id Faker::Number.number(9)
  end
end
