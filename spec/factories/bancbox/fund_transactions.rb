FactoryGirl.define do
  factory :bancbox_fund_transaction, :class => Bancbox::FundTransaction do
    amount Faker::Number.number(4)
    memo Faker::Lorem.characters(16)
  end
end
