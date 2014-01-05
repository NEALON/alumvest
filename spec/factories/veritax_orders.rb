FactoryGirl.define do
  factory :veritax_order, :class => 'Veritax::Order' do
    vt_order_id "vt_order_id"
    status "submitted"
  end
end
