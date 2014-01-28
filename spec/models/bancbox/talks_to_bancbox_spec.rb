require 'spec_helper_without_capybara'
WebMock.allow_net_connect!

describe TalksToBancbox do

  context 'create investor' do
    before :each do
      @user = FactoryGirl.create(:user, :user_type => 'Investor')
      @bank_account = FactoryGirl.create(:bank_account, :user => @user)
    end

    it 'succeeds' do
      expect(TalksToBancbox.submit_investor!(@user, @bank_account)).to be_true
      expect(@user.reload.investor.bancbox_investor.has_bancbox_account?).to be_true
    end

    it 'fails' do
      @user.update_attribute(:home_phone, 'BAD_PHONE_NUMBER')
      result = TalksToBancbox.submit_investor!(@user, @bank_account)
      result.class.should == BancBoxCrowd::Error
    end
  end

  context 'create issuer' do
    before :each do
      @user = FactoryGirl.create(:user, :user_type => 'Issuer')
      @bank_account = FactoryGirl.create(:bank_account, :user => @user)
    end

    it 'succeeds' do
      expect(TalksToBancbox.submit_issuer!(@user, @bank_account)).to be_true
      expect(@user.reload.issuer.bancbox_issuer.has_bancbox_account?).to be_true
    end

    it 'fails' do
      @user.update_attribute(:home_phone, 'BAD_PHONE_NUMBER')
      result = TalksToBancbox.submit_issuer!(@user, @bank_account)
      result.class.should == BancBoxCrowd::Error
    end
  end

  context 'create escrow' do
    before :each do
      @user = FactoryGirl.create(:user, :user_type => 'Issuer')
      @bank_account = FactoryGirl.create(:bank_account, :user => @user)
      @campaign = create_live_campaign_without_escrow(@issuer)
      TalksToBancbox.submit_issuer!(@user, @bank_account)
    end

    it 'succeeds' do
      result = TalksToBancbox.create_escrow!(@user.reload, @campaign)
      expect(result).to be_true
      escrow = @campaign.bancbox_escrow
      expect(escrow).to_not be_nil
      expect(escrow.bancbox_status_name).to eq(:unsubmitted)
      expect(escrow.open!).to eq(true)
      expect(escrow.bancbox_status_name).to eq(:open_pending)
    end
  end

  context 'fund escrow' do
    before :each do
      @user = FactoryGirl.create(:user, :user_type => 'Issuer')
      @campaign = create_live_campaign(@user.issuer)
      @investor_user = FactoryGirl.create(:user, :user_type => 'Investor')
      @bank_account = FactoryGirl.create(:bank_account, :user => @investor_user)
      TalksToBancbox.submit_investor!(@investor_user, @bank_account)
      @investment = FactoryGirl.create(:investment, :campaign => @campaign, :investor => @investor_user.reload.investor)
      @campaign.bancbox_escrow.fire_bancbox_status_event(:escrow_opened) # manually flip it to open
    end

    it 'succeeds' do
      result = TalksToBancbox.fund_escrow!(@campaign, @investment, 10)
      expect(result["investor_id"].to_s).to eq(@investor_user.investor.bancbox_investor.bancbox_id)
    end
  end
end
