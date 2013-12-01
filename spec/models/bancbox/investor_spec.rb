require 'spec_helper_without_capybara'

describe Bancbox::Investor do
  before :all do
    @user = FactoryGirl.create(:user)
    @investor = FactoryGirl.create(:bancbox_investor)
    @investor.user = @user
    #puts @investor.to_json
    @investor.should be_valid
    @investor.submit!
  end

  it "can create a bancbox investor" do
    @investor.submitted?.should == true
    @investor.bancbox_id.should_not == nil
    @investor.bank_name.should_not == nil
    @investor.account_number.should_not == nil
    @investor.account_routing_number.should_not == nil
    @investor.account_type.should_not == nil
  end

  it "can link external bank account" do
    @bank_account = FactoryGirl.create(:bancbox_bank_account)
    @bank_account.investor = @investor
    @bank_account.should be_valid

    @investor.link_bank_account(:investor, @bank_account)

    @bank_account.bancbox_id.should_not == nil
    @investor.investor_bank_accounts.size.should_not == 0
  end

  it "can fund account" do
    @transaction = FactoryGirl.create(:bancbox_fund_transaction)
    @transaction.investor = @investor
    @transaction.should be_valid
    @bank_account = FactoryGirl.create(:bancbox_bank_account)
    @bank_account.investor = @investor
    @bank_account.should be_valid

    @investor.fund_account_and_link_bank!(:investor, @transaction, @bank_account)

    @investor.pendingbalance.should_not == 0
    @investor.investor_bank_accounts.size.should_not == 0
    @investor.investor_fund_transactions.size.should_not == 0
  end

  it "can link external bank account then fund from that" do
    @bank_account = FactoryGirl.create(:bancbox_bank_account)
    @bank_account.investor = @investor
    @bank_account.should be_valid
    @investor.link_bank_account(:investor, @bank_account)

    @transaction = FactoryGirl.create(:bancbox_fund_transaction)
    @transaction.investor = @investor
    @investor.fund_account!(:investor, @transaction, @bank_account)

    @investor.pendingbalance.should_not == 0
    @investor.investor_bank_accounts.size.should_not == 0
    @investor.investor_fund_transactions.size.should_not == 0
  end
end
