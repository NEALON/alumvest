FactoryGirl.define do
  factory :job, :class => Alumvest::Job do
    title Faker::Lorem.sentence
    description "#{Faker::Lorem.sentence} #{Faker::Lorem.sentence}"
    contact Faker::Internet.email
  end
end
