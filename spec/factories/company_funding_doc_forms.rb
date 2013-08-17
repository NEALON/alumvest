FactoryGirl.define do
  factory :company_funding_doc_form do
    business_plan_url                 Faker::Internet.url
    tbd_financial_document_url        Faker::Internet.url
    tbd_funding_document_url          Faker::Internet.url
    tbd_detailed_metrics_document_url Faker::Internet.url
    recent_investors                  Faker::Lorem.sentence(6)
    roadmap                           Faker::Lorem.sentence(6)
    shareholder_message               Faker::Lorem.sentence(6)
  end
end
