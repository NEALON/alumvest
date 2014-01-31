FactoryGirl.define do
  factory :update, :class => Alumvest::Update do
    subject Faker::Lorem.sentence
    details "#{Faker::Lorem.sentence} #{Faker::Lorem.sentence}"
    visibility "Just Me"
    video_url 'http://www.youtube.com/embed/OQSNhk5ICTI'
  end
end
