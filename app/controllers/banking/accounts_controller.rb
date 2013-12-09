class Banking::AccountsController < ApplicationController

  def show
    @user = User.find_by_id(params[:user_id])
    @banking_account = @user.banking_account || Banking::Account.create(:user => @user)
    if (v = @banking_account.bancbox_identity_verification) && v.verified?

      if @user.is_investor?
        if @banking_account.bancbox_investor
          render :layout => 'bankers'
        else
          redirect_to new_user_banking_account_bancbox_investor_path(@user)
        end
      else
        if @user.is_owner?
          if @banking_account.bancbox_issuer
            render :layout => 'bankers'
          else
            redirect_to new_user_banking_account_bancbox_issuer_path(@user)
          end
        else
          raise 'Unknown user type for bank account creation.'
        end
      end
    else
      redirect_to user_banking_identity_path(@user)
    end
  end
end
