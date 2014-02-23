FactoryGirl.define do
  factory :signable_subscription_document, :class => Alumvest::Document do
    name                'Signable Document'
    file_url            '0.0.0.0/signable_document'
    type                'Alumvest::SubscriptionDoc'
    signature_required  true
    template
  end
end
