# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bancbox_transaction, :class => 'Bancbox::Transaction' do
    type ""
    value "9.99"
  end
end
