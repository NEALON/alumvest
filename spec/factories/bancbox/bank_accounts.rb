FactoryGirl.define do
  factory :bancbox_bank_account, :class => Bancbox::BankAccount do
    bank_account_holder Faker::Name.first_name
    bank_account_type "CHECKING"
    bank_account_routing "011000028"
    bank_account_number Faker::Number.number(7)
  end

  factory :vcr_bancbox_investor_bank_account, :class => Bancbox::BankAccount do
    bank_account_holder "Casper"
    bank_account_type "CHECKING"
    bank_account_routing "011000028"
    bank_account_number "86592162"
  end

  factory :vcr_bancbox_issuer_bank_account, :class => Bancbox::BankAccount do
    bank_account_holder "Noah"
    bank_account_type "CHECKING"
    bank_account_routing "011000028"
    bank_account_number "47854719"
  end
end
