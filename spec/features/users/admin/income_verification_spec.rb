require 'spec_helper'

describe 'users investor income verification', :type => :feature do

  before :each do
    sign_up :admin
    u = User.last
    u.update_attribute(:user_type, 'admin')
    visit user_admin_path(u)
  end

  context 'viewing completed veritax orders' do

    before :each do
      FactoryGirl.create(:veritax_order, :vt_order_id => CompletedOrderId)
    end

    it 'sees their listing' do
      pending
    end
  end
end