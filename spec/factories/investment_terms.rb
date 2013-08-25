FactoryGirl.define do
  factory :investment_term do
    fundraising_amount                1000
    funds_retained                    'All-or-nothing'
    equity_type                       'Convertible Note'
    campaign_length                   90
    business_plan_url                 Faker::Internet.url
    tbd_financial_document_url        Faker::Internet.url
    tbd_funding_document_url          Faker::Internet.url
    tbd_detailed_metrics_document_url Faker::Internet.url
    recent_investors                  Faker::Lorem.sentence(6)
    roadmap                           Faker::Lorem.sentence(6)
    shareholder_message               Faker::Lorem.sentence(6)
  end
end
