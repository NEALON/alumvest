class Banking::Bancbox::WithdrawalsController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def create
    @user = User.find_by_id(params[:user_id])
    @banking_account, @bancbox_account = @user.banking_account, @user.banking_account.bancbox_account
    withdrawal = Bancbox::Withdrawal.create(:bancbox_account => @bancbox_account, :value => params[:withdrawal][:value])
    redirect_to user_banking_account_bancbox_transactions_path(@user),
                :flash => {:success => "You have successfully withdrawn #{number_to_currency(withdrawal.value)}"}
  end
end