FactoryGirl.define do
  factory :investment, :class => Alumvest::Investment::Base do
    status 'pending'
  end
end
