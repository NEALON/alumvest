FactoryGirl.define do
  factory :envelope, :class => Docusign::EnvelopeBase do
    template_id 1
    email_subject "MyString"
    email_body "MyText"
  end
end
