FactoryGirl.define do
  factory :envelope, :class => Docusign::Envelope::Base do
    template_id 1
    status "MyString"
    email_subject "MyString"
    email_body "MyText"
  end
end
