def populate_person
  first_name (f = Faker::Name.first_name)
  last_name (l = Faker::Name.last_name)
  title Faker::Name.title
  avatar_url '/30x30.gif'
  facebook "#{f}_#{l}"
  twitter "@#{f}_#{l}"
  linkedin "#{f}_#{l}"
  introduction "#{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)}"
  video_url 'http://www.youtube.com/embed/OQSNhk5ICTI'
end

FactoryGirl.define do
  factory :team_member do populate_person; end
  factory :team do
    team_highlights "#{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)} #{Faker::Lorem.sentence(10)}"
  end
end