FactoryGirl.define do
  factory :bancbox_bank_account, :class => Bancbox::BankAccount do
    bank_account_holder Faker::Name.first_name
    bank_account_type "CHECKING"
    bank_account_routing "011000028"
    bank_account_number Faker::Number.number(7)
  end
end
