def populate_person
  first_name (f = Faker::Name.first_name)
  last_name (l = Faker::Name.last_name)
  title Faker::Name.title
  avatar_url 'http://placehold.it/30x30'
  facebook "#{f}_#{l}"
  twitter "@#{f}_#{l}"
  linkedin "#{f}_#{l}"
  video_url 'http://www.youtube.com/embed/OQSNhk5ICTI'
end

FactoryGirl.define do
  factory :team_member do populate_person; end
  factory :team do
    team_highlights "#{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)}"
  end
end