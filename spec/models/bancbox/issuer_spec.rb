require 'spec_helper_without_capybara'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :webmock
end

describe Bancbox::Issuer do
  before :each do
    VCR.use_cassette('bancbox', :match_requests_on => [:method, :uri], :record => :new_episodes) do
      @user = FactoryGirl.create(:user)
      @issuer = FactoryGirl.create(:vcr_bancbox_issuer)
      @bank_account = FactoryGirl.create(:vcr_bancbox_issuer_bank_account)
      @issuer.should be_valid
      @bank_account.user = @user
      @bank_account.should be_valid
      @issuer.submit!(@bank_account)
    end
  end

  it "can create a bancbox issuer" do
    @issuer.submitted?.should == true
    @issuer.bancbox_id.should_not == nil
    @issuer.bank_name.should_not == nil
    @issuer.account_number.should_not == nil
    @issuer.account_routing_number.should_not == nil
    @issuer.account_type.should_not == nil
    @user.bank_account.should_not == nil
  end

  it "can create escrow" do
    VCR.use_cassette('bancbox', :match_requests_on => [:method, :uri], :record => :new_episodes) do
      @escrow = FactoryGirl.create(:vcr_bancbox_escrow)
      @escrow.issuer = @issuer
      @escrow.bancbox_status_name.should == :unsubmitted
      @escrow.open!.should == true
      @escrow.bancbox_status_name.should == :open_pending
      @escrow.update_from_server!
      @escrow.bancbox_status_name.should == :opened
      @escrow.current_balance.should == 100
      @escrow.total_funding.should == 100
    end
  end
end
