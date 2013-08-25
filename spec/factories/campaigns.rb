FactoryGirl.define do
  factory :campaign do
    permalink Faker::Lorem.word
    pitch "#{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)}"
    planned_fund_usage "#{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)}"
  end
end
