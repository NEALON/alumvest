FactoryGirl.define do
  factory :investment_term, :class => Alumvest::InvestmentTerm::Base do
    fundraising_amount      1000
    min_investment          10
    max_investment          100
    campaign_length         90
    funds_retained          'All-or-nothing'
    fees_paid_by            'Issuer'
    elevator_pitch          "#{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)}"
    investment_details      "#{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)}"
    equity_type             'Convertible Note'
    business_plan_url       Faker::Internet.url
    financial_statement_url Faker::Internet.url
    term_sheet_url          Faker::Internet.url
  end
end
