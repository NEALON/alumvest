FactoryGirl.define do
  factory :issuer, :class => Alumvest::Issuer::Base do
    ssn '000-00-0000'
    financial_info 'MyText'
    experience 'MyText'
    expertise 'MyText'
    marital_status 'MyString'
    personal_message 'MyText'
    user nil
  end
end
