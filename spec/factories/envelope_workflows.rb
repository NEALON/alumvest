# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :envelope_workflow do
    contract_doc_group_id 1
    document_id 1
    status "MyString"
  end
end
