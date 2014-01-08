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
      @investor = FactoryGirl.create(:investor)
      @investor.user = @user
      @bancbox_investor = FactoryGirl.create(:vcr_bancbox_investor)
      @bancbox_investor.investor_user = @investor
      @bank_account = FactoryGirl.create(:vcr_bancbox_investor_bank_account)
      @bancbox_investor.should be_valid
      @bank_account.user = @user
      @bank_account.should be_valid
      @bancbox_investor.submit!(@bank_account)
    end
  end

  it "can create a bancbox investor" do
    @bancbox_investor.submitted?.should == true
    @bancbox_investor.bancbox_id.should_not == nil
    @bancbox_investor.bank_name.should_not == nil
    @bancbox_investor.account_number.should_not == nil
    @bancbox_investor.account_routing_number.should_not == nil
    @bancbox_investor.account_type.should_not == nil
    @user.bank_account.should_not == nil
  end

  it "can fund escrow" do
    VCR.use_cassette('bancbox', :match_requests_on => [:method, :uri], :record => :new_episodes) do
      @escrow = FactoryGirl.create(:vcr_established_bancbox_escrow)
      @escrow.issuer = @issuer
      @escrow.fire_bancbox_status_event(:escrow_opened) # manually flip it to open
      ret = @escrow.fund!(@investor, 100)
      ret["amount"].should == 100
      ret["escrow_current_balance"].should == 100
    end
  end

  #it "can ask his investment refunded" do
    #VCR.use_cassette('bancbox', :match_requests_on => [:method, :uri], :record => :new_episodes) do
      #@escrow = FactoryGirl.create(:vcr_established_bancbox_escrow)
      #@escrow.issuer = @issuer
      #@escrow.fire_bancbox_status_event(:escrow_opened) # manually flip it to open
      #@escrow.refund!(@bancbox_investor).should == true
    #end
  #end
end
