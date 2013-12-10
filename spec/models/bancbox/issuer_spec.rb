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
      @issuer = FactoryGirl.create(:bancbox_issuer)
      @bank_account = FactoryGirl.create(:bancbox_bank_account)
      @issuer.should be_valid
      @bank_account.issuer = @issuer
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
    @issuer.issuer_bank_accounts.size.should == 1
  end

  it "can link another external bank account" do
    VCR.use_cassette('bancbox', :match_requests_on => [:method, :uri], :record => :new_episodes) do
      another_bank_account = FactoryGirl.create(:bancbox_bank_account)
      another_bank_account.issuer = @issuer
      another_bank_account.should be_valid

      @issuer.issuer_bank_accounts.size.should == 1
      @issuer.link_bank_account(:issuer, another_bank_account)
      @issuer.issuer_bank_accounts.size.should == 2
    end
  end

  it "can create escrow" do
    VCR.use_cassette('bancbox', :match_requests_on => [:method, :uri], :record => :new_episodes) do
      @escrow = FactoryGirl.create(:vcr_bancbox_escrow)
      @escrow.issuer = @issuer
      @escrow.open!.should == true
      puts @escrow.get_details
    end
  end
end
