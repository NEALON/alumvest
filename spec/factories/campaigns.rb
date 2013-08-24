FactoryGirl.define do
  factory :campaign do
    permalink Faker::Lorem.word
    pitch "#{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)}"
    amount 100
    planned_fund_usage "#{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)}"
    length_in_days 90
  end
end
