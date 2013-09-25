FactoryGirl.define do
  factory :job do
    title Faker::Lorem.sentence
    description "#{Faker::Lorem.sentence} #{Faker::Lorem.sentence}"
    contact Faker::Internet.email
  end
end
