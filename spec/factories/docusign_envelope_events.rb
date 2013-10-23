# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :docusign_envelope_event do
    envelope_id 1
    status "MyString"
    status_date_time "2013-10-22 16:01:40"
  end
end
