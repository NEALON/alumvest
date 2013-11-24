class Banking::IdentitiesController < ApplicationController

  def show
    @user = User.find_by_id(params[:user_id])
    @banking_account = @user.banking_account
    @identity = @banking_account.bancbox_identity_verification || Bancbox::IdentityVerification.create(:banking_account => @banking_account)
    render :layout => 'bankers'
  end

  def update
    @user = User.find_by_id(params[:user_id])
    @banking_account = @user.banking_account
    @identity = @banking_account.bancbox_identity_verification
    if params[:verified] == 'true'
      @identity.verify!
      redirect_to user_banking_account_path(@user), :flash => {:success => 'You identity was verified.'}
    else
      @identity.reject!
      redirect_to user_banking_account_path(@user), :flash => {:danger => 'You identity could not be verified.'}
    end
  end
end
