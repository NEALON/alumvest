FactoryGirl.define do
  factory :identity do
    first_name 'Alumvest'
    last_name 'Last Name'
    email 'someone@alumvest.com'
    password 'secret'
    password_confirmation 'secret'
  end
end
