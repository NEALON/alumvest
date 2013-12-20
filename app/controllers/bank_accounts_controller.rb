class BankAccountsController < ApplicationController

  def new
    @user = User.find_by_id(params[:user_id])
    @active = 'bank_account'

    if @user.profile_complete?
      @bank_account = Bancbox::BankAccount.new(
          :user => @user,
          :bank_account_holder => current_user.name,
          :bank_account_routing => Bancbox::BankAccount::DefaultRoutingNumber)
      render :layout => "users"
    else
      render 'show_profile_incomplete', :layout => 'users'
    end
  end

  def create
    @user = User.find_by_id(params[:user_id])
    @bank_account = Bancbox::BankAccount.create(params[:bancbox_bank_account])
    if @bank_account.valid?
      create_bancbox_account
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
      bancbox_entity = (@user.is_investor? ? @user.investor.bancbox_investor : @user.owner.bancbox_issuer)
      unless bancbox_entity.has_bancbox_account?
        create_bancbox_account
      else
        redirect_to user_bank_account_path(@user), :flash => {:sucess => 'Your bank account information was saved.'}
      end
    else
      render :action => :edit
    end
  end

  private

  def create_bancbox_account
    if @user.is_investor?
      result = BancboxManager.submit_investor!(@user, @bank_account)
    else
      result = BancboxManager.submit_issuer!(@user, @bank_account)
    end
    unless result.class == BancBoxCrowd::Error
      redirect_to user_bank_account_path(@user), :flash => {:sucess => 'Your bank account information was saved.'}
    else
      redirect_to user_bank_account_path(@user), :flash => {:danger => "Bancbox error: #{eval(result.message)['message']}"}
    end
  end
end