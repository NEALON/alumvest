FactoryGirl.define do
  factory :company_market_form do
    product_media_url     'http://www.youtube.com/watch?v=OQSNhk5ICTI'
    market_info           Faker::Lorem.sentence(6)
    competitive_landscape Faker::Lorem.sentence(6)
  end
end
