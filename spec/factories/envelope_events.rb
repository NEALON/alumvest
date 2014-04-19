FactoryGirl.define do
  factory :envelope_event, :class => Docusign::EnvelopeEventBase do
    envelope_id 1
    status "MyString"
    status_date_time "2013-10-22 16:01:40"
  end
end
