class BankAccountsController < ApplicationController

  def new
    @user = Alumvest::UserBase.find_by_id(params[:user_id])
    @active = 'bank_account'

    if @user.profile_complete?
      @bank_account = Bancbox::BankAccount.new(
          :user => @user,
          :bank_account_holder => current_user.name,
      )
      # authorize! :manage, @bank_account
    else
      render 'show_profile_incomplete'
    end
  end

  def create
    @user = Alumvest::UserBase.find_by_id(params[:user_id])
    @bank_account = Bancbox::BankAccount.create(params[:bancbox_bank_account])
    # authorize! :manage, @bank_account
    if @bank_account.valid?
      create_bancbox_account
    else
      render :action => :new
    end
  end

  def show
    @user = Alumvest::UserBase.find_by_id(params[:user_id])
    @active = 'bank_account'
    @bank_account = @user.bank_account
    # authorize! :manage, @bank_account
  end

  def edit
    @user = Alumvest::UserBase.find_by_id(params[:user_id])
    @active = 'bank_account'
    # authorize! :manage, @bank_account
    unless (@bank_account = @user.bank_account)
      redirect_to new_user_bank_account_path(@user)
    else
      render 'edit'
    end
  end

  def update
    @user = Alumvest::UserBase.find_by_id(params[:user_id])
    @bank_account = @user.bank_account
    # authorize! :manage, @bank_account
    @bank_account.update_attributes(params[:bancbox_bank_account])
    if @bank_account.valid?
      bancbox_entity = (@user.is_investor? ? @user.investor.bancbox_investor : @user.issuer.bancbox_issuer)
      unless bancbox_entity.has_bancbox_account?
        create_bancbox_account
      else
        redirect_to edit_user_bank_account_path(@user), :flash => {:sucess => 'Your bank account information was saved.'}
      end
    else
      render :action => :edit
    end
  end

  private

  def create_bancbox_account
    if @user.is_investor?
      result = TalksToBancbox.submit_investor!(@user, @bank_account)
    else
      result = TalksToBancbox.submit_issuer!(@user, @bank_account)
    end
    unless result.class == BancBoxCrowd::Error
      redirect_to edit_user_bank_account_path(@user), :flash => {:sucess => 'Your bank account information was saved.'}
    else
      redirect_to edit_user_bank_account_path(@user), :flash => {:warning => "Bancbox error: #{eval(result.message)['message']}"}
    end
  end
end
