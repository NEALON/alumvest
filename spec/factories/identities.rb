FactoryGirl.define do
  factory :identity, :class => Alumvest::Identity do
    first_name 'Alumvest'
    last_name 'Last Name'
    email 'someone@alumvest.com'
    password 'secret'
    password_confirmation 'secret'
  end
end
