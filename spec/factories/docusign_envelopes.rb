# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :docusign_envelope do
    template_id 1
    status "MyString"
    email_subject "MyString"
    email_body "MyText"
  end
end
