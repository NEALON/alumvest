require 'spec_helper_without_capybara'

describe 'BancboxAccountManager' do

  before :each do
    @user = FactoryGirl.create(:user, :user_type => 'Investor')
    @bank_account = FactoryGirl.create(:bank_account, :user => @user)
  end

  it 'succeeds' do
    expect(BancboxAccountManager.banking_account_updated!(@user, @bank_account)).to be_true
    @user.reload
    expect(@user.investor.bancbox_investor.has_bancbox_account?).to be_true
  end

  it 'fails' do
    @user.update_attribute(:home_phone, 'BAD_PHONE_NUMBER')
    result = BancboxAccountManager.banking_account_updated!(@user, @bank_account)
    result.class.should == BancBoxCrowd::Error
  end
end
