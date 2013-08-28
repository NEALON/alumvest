FactoryGirl.define do
  factory :investment_term do
    fundraising_amount                1000
    campaign_length                   90
    funds_retained                    'All-or-nothing'
    fees_paid_by                      "Owner"
    elevator_pitch                    "#{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)}"
    planned_fund_usage                "#{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)}"
    equity_type                       'Convertible Note'
    business_plan_url                 Faker::Internet.url
    tbd_financial_document_url        Faker::Internet.url
    tbd_funding_document_url          Faker::Internet.url
    tbd_detailed_metrics_document_url Faker::Internet.url
    recent_investors                  Faker::Lorem.sentence(6)
    roadmap                           Faker::Lorem.sentence(6)
    shareholder_message               Faker::Lorem.sentence(6)
  end
end
