class BankAccountsController < ApplicationController

  def new
    @user = User.find_by_id(params[:user_id])
    @active = 'bank_account'
    @bank_account = Bancbox::BankAccount.new(:user => @user, :bank_account_holder => current_user.name)
    render :layout => "users"
  end

  def create
    @user = User.find_by_id(params[:user_id])
    @bank_account = Bancbox::BankAccount.create(params[:bancbox_bank_account])
    if @bank_account.valid?
      redirect_to user_bank_account_path(@user), :flash => {:sucess => 'Bank account info saved.'}
    else
      render :action => :new
    end
  end

  def show
    @user = User.find_by_id(params[:user_id])
    @active = 'bank_account'
    @bank_account = @user.bank_account
    render :layout => "users"
  end

  def edit
    @user = User.find_by_id(params[:user_id])
    @active = 'bank_account'
    @bank_account = @user.bank_account
    render 'edit', :layout => "users"
  end

  def update
    @user = User.find_by_id(params[:user_id])
    @bank_account = @user.bank_account
    @bank_account.update_attributes(params[:bancbox_bank_account])
    if @bank_account.valid?
      redirect_to user_bank_account_path(@user), :flash => {:sucess => 'Bank account info saved.'}
    else
      render :action => :edit
    end
  end
end