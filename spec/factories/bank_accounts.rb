FactoryGirl.define do
  factory :bank_account, :class => Bancbox::BankAccount do
    bank_account_number '666'
    bank_account_type 'CHECKING'
    bank_account_holder 'Ling Chen'
    bank_account_routing Bancbox::BankAccount::DefaultRoutingNumber
  end
end
