require 'spec_helper_without_capybara'

describe Bancbox::Investor do
  before :all do
    @user = FactoryGirl.create(:user)
    @investor = FactoryGirl.create(:bancbox_investor)
    @bank_account = FactoryGirl.create(:bancbox_bank_account)
    @investor.user = @user
    @investor.should be_valid
    @bank_account.investor = @investor
    @bank_account.should be_valid
    @investor.submit!(@bank_account)
  end

  it "can create a bancbox investor" do
    @investor.submitted?.should == true
    @investor.bancbox_id.should_not == nil
    @investor.bank_name.should_not == nil
    @investor.account_number.should_not == nil
    @investor.account_routing_number.should_not == nil
    @investor.account_type.should_not == nil
    @investor.investor_bank_accounts.size.should == 1
  end

  it "can link another external bank account" do
    @bank_account = FactoryGirl.create(:bancbox_bank_account)
    @bank_account.investor = @investor
    @bank_account.should be_valid

    @investor.link_bank_account(:investor, @bank_account)
    @investor.investor_bank_accounts.size.should == 2
  end
end
