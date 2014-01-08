FactoryGirl.define do
  factory :owner do
    ssn "000-00-0000"
    financial_info "MyText"
    experience "MyText"
    expertise "MyText"
    marital_status "MyString"
    personal_message "MyText"
    user nil
  end
end
