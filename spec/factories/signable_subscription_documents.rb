FactoryGirl.define do
  factory :signable_subscription_document, :class => Alumvest::Document do
    name                'Important Document'
    file_url            '0.0.0.0/important_document'
    type                'Alumvest::SubscriptionDoc'
    signature_required  true
    template
  end
end
