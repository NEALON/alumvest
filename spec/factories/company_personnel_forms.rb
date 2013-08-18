FactoryGirl.define do
  factory :legal_counsel do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
  end
  factory :founder do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
  end
  factory :team_member do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
  end
  factory :board_member do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
  end
  factory :advisor do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
  end

  factory :company_personnel_form
end