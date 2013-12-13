require 'spec_helper_without_capybara'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :webmock
end

describe Bancbox::Investor do
  before :each do
    VCR.use_cassette('bancbox', :match_requests_on => [:method, :uri], :record => :new_episodes) do
      @user = FactoryGirl.create(:user)
      @investor = FactoryGirl.create(:vcr_bancbox_investor)
      @bank_account = FactoryGirl.create(:vcr_bancbox_investor_bank_account)
      @investor.should be_valid
      @bank_account.investor = @investor
      @bank_account.should be_valid
      @investor.submit!(@bank_account)
    end
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
    VCR.use_cassette('bancbox', :match_requests_on => [:method, :uri], :record => :new_episodes) do
      another_bank_account = FactoryGirl.create(:bancbox_bank_account)
      another_bank_account.investor = @investor
      another_bank_account.should be_valid

      @investor.investor_bank_accounts.size.should == 1
      @investor.link_bank_account(:investor, another_bank_account)
      @investor.investor_bank_accounts.size.should == 2
    end
  end

  it "can fund escrow" do
    VCR.use_cassette('bancbox', :match_requests_on => [:method, :uri], :record => :new_episodes) do
      @escrow = FactoryGirl.create(:vcr_established_bancbox_escrow)
      @escrow.issuer = @issuer
      @escrow.fund!(@investor, @bank_account, 100).should == false
      @escrow.fire_bancbox_status_event(:open_escrow) # manually flip it to open
      @escrow.fund!(@investor, @bank_account, 100).should == true
    end
  end
end
