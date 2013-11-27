class Banking::Bancbox::AccountsController < ApplicationController

  def update
    @user = User.find_by_id(params[:user_id])
    @banking_account = @user.banking_account
    @bancbox_account = @banking_account.bancbox_account || Bancbox::Account.create(:banking_account => @banking_account)

    if params[:created] == 'true'
      @bancbox_account.create!
      @banking_account.activate!
      redirect_to user_banking_account_path(@user), :flash => {:success => 'Your Bancbox account was created.'}
    else
      @bancbox_account.fail!
      redirect_to user_banking_account_path(@user), :flash => {:danger => 'Your Bancbox account could not be created.'}
    end
  end
end