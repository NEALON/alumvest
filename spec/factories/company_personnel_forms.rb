def populate_person
  first_name (f = Faker::Name.first_name)
  last_name (l = Faker::Name.last_name)
  avatar_url 'http://placehold.it/30x30'
  facebook "#{f}_#{l}"
  twitter "@#{f}_#{l}"
  linkedin "#{f}_#{l}"
end

FactoryGirl.define do
  factory :legal_counsel do populate_person; end
  factory :founder do populate_person; end
  factory :team_member do populate_person; end
  factory :board_member do populate_person; end
  factory :advisor do populate_person; end

  factory :company_personnel_form
end