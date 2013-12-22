require 'spec_helper_without_capybara'

describe 'TalksToBancbox' do
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
      @user = FactoryGirl.create(:user, :user_type => 'Owner')
      @bank_account = FactoryGirl.create(:bank_account, :user => @user)
    end

    it 'succeeds' do
      expect(TalksToBancbox.submit_issuer!(@user, @bank_account)).to be_true
      expect(@user.reload.owner.bancbox_issuer.has_bancbox_account?).to be_true
    end

    it 'fails' do
      @user.update_attribute(:home_phone, 'BAD_PHONE_NUMBER')
      result = TalksToBancbox.submit_issuer!(@user, @bank_account)
      result.class.should == BancBoxCrowd::Error
    end
  end

  context 'create escrow' do
    before :each do
      @user = FactoryGirl.create(:user, :user_type => 'Owner')
      @bank_account = FactoryGirl.create(:bank_account, :user => @user)
      @campaign = create_live_campaign(@user.owner)
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
end
