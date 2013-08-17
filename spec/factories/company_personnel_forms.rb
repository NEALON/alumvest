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
end

FactoryGirl.define do
  factory :company_personnel_form do
    legal_counsel [FactoryGirl.create(:legal_counsel)]
    founders [FactoryGirl.create(:founder)]
    team_members [FactoryGirl.create(:team_member)]
    board_members [FactoryGirl.create(:board_member)]
    advisors [FactoryGirl.create(:advisor)]
  end
end
