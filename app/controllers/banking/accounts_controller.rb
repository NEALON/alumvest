class Banking::AccountsController < ApplicationController

  def show
    @user = User.find_by_id(params[:user_id])
    @banking_account = @user.banking_account || Banking::Account.create(:user => @user)
    if (v = @banking_account.bancbox_identity_verification) && v.verified?
      render :layout => 'bankers'
    else
      redirect_to user_banking_identity_path(@user)
    end
  end
end
