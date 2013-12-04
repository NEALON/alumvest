FactoryGirl.define do
  factory :investment_term do
    fundraising_amount      10000
    min_investment          100
    max_investment          10000
    campaign_length         90
    funds_retained          'All-or-nothing'
    fees_paid_by            'Owner'
    elevator_pitch          "#{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)}"
    investment_details      "#{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)}"
    equity_type             'Convertible Note'
    business_plan_url       Faker::Internet.url
    financial_statement_url Faker::Internet.url
    term_sheet_url          Faker::Internet.url
  end
end
