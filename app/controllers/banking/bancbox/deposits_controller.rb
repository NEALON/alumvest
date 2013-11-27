class Banking::Bancbox::DepositsController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def create
    @user = User.find_by_id(params[:user_id])
    @banking_account, @bancbox_account = @user.banking_account, @user.banking_account.bancbox_account
    deposit = Bancbox::Deposit.create(:bancbox_account => @bancbox_account, :value => params[:deposit][:value])
    redirect_to user_banking_account_bancbox_transactions_path(@user),
                :flash => {:success => "You have successfully deposited #{number_to_currency(deposit.value)}"}
  end
end