class Banking::Bancbox::TransactionsController < ApplicationController

  def index
    @user = User.find_by_id(params[:user_id])
    @banking_account, @bancbox_account = @user.banking_account, @user.banking_account.bancbox_account
    @transactions = @bancbox_account.transactions.recent_first

    render :layout => 'bankers'
  end
end