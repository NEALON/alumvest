FactoryGirl.define do
  factory :campaign do
    permalink Faker::Lorem.word
    title Faker::Lorem.sentence(4)
    headline Faker::Lorem.sentence(10)
    summary Faker::Lorem.sentence(20)
    pitch "#{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)}"
    amount 100
    planned_fund_usage "#{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)}"
    length_in_days 90
    video_url 'http://www.youtube.com/watch?v=OQSNhk5ICTI'
    photo_url 'http://placehold.it/100x100'
  end
end
