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

  factory :vcr_bancbox_investor, :class => Bancbox::Investor do
    first_name "Baron"
    last_name "Berge"
    phone "5921178712"
    email "vanea.lynch@berge.name"
    address_1 "133 Yundt Crossroad"
    city "East Sheaton"
    state "GU"
    zip "19983"
    agreement true
    investor_type "Individual/LLC"
    reference_id "f665d44b-217e-412d-84e5-fd4700c1e094"
  end
end
