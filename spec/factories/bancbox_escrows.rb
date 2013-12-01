# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bancbox_escrow, :class => 'Bancbox::Escrow' do
    name "MyString"
    reference_id ""
    start_date "2013-11-30"
    close_date "2013-11-30"
    funding_goal 1.5
    minimum_funding_amount 1.5
    securities_offered "MyString"
    securities_offered_other "MyString"
    over_funding_amount 1.5
    maximum_funding_amount 1.5
    current_balance 1.5
    total_funding 1.5
    status "MyString"
  end
end
