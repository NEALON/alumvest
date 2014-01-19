FactoryGirl.define do
  factory :veritax_order, :class => 'Veritax::Order' do
    id {rand(1000000)}
    ssn Faker::Ssn.en_ssn
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    address Faker::Address.street_address
    city Faker::Address.city
    state Faker::Address.state_abbr
    zip_code '18901'
    previous_address Faker::Address.street_address
    previous_city Faker::Address.city
    previous_state Faker::Address.state_abbr
    previous_zip '18901'
    email Faker::Internet.email
  end
end
