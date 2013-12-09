# Read about factories at https://github.com/thoughtbot/factory_girl
require 'date'

FactoryGirl.define do
  factory :vcr_bancbox_escrow, :class => 'Bancbox::Escrow' do
    name Faker::Name.first_name
    start_date Date.today + 1
    close_date Date.today + 100
    funding_goal 1000000
    minimum_funding_amount 10
    maximum_funding_amount 1000
    securities_offered "EQUITY"
    over_funding_amount 1000000
    issuer_signatory_email "kyle+test+escrow@alumvest.com"
    issuer_signatory_name "Kyle Escrow Issuer"
    issuer_signatory_title "Kyle Escrow Title"
  end

end
