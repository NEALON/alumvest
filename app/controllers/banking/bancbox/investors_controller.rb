class Banking::Bancbox::InvestorsController < ApplicationController

  def new
    @user = User.find_by_id(params[:user_id])
    @banking_account = @user.banking_account || Banking::Account.create(:user => @user)
    @investor = Bancbox::Investor.create(:banking_account => @banking_account)
    render :layout => 'bankers'
    # investor belongs to banking @bank_account
    # bancbox account can go away
  end

  #def update
  #  @user = User.find_by_id(params[:user_id])
  #  @banking_account = @user.banking_account
  #  @bancbox_account = @banking_account.bancbox_account || Bancbox::Account.create(:banking_account => @banking_account)
  #
  #  if params[:created] == 'true'
  #    @banking_account.activate!
  #    redirect_to user_banking_account_path(@user), :flash => {:success => 'Your Bancbox account was created.'}
  #  else
  #    redirect_to user_banking_account_path(@user), :flash => {:danger => 'Your Bancbox account could not be created.'}
  #  end
  #end



  def show
    @user = User.find_by_id(params[:user_id])
    @bancbox_investor = @user.bancbox_investor || Bancbox::Investor.create(:user => @user)
    render :layout => "investors"
  end

  def edit
    @user = User.find_by_id(params[:user_id])
    @bancbox_investor = @user.bancbox_investor
    render :layout => "investors"
  end

  def update
    @user = User.find(params[:user_id])
    @bancbox_investor = @user.bancbox_investor
    @bancbox_investor.update_attributes(params[:bancbox_investor])
    if @bancbox_investor.valid?
      unless @bancbox_investor.submitted?
        @bancbox_investor.submit!
      end
      redirect_to user_bancbox_investor_path(@user), :flash => {:success => 'Bancbox investor info saved.' }
    else
      render :edit
    end
  end

  def new_fund
    @user = User.find_by_id(params[:user_id])
    @bancbox_investor = @user.bancbox_investor
    @transaction = Bancbox::FundTransaction.new
    @bank_account = Bancbox::BankAccount.new
    render :new_fund, :layout => "investors"
  end

  def new_bank_account
    @user = User.find_by_id(params[:user_id])
    @bancbox_investor = @user.bancbox_investor
    @bank_account = Bancbox::BankAccount.new
    render :new_bank_account, :layout => "investors"
  end

  def fund
    @user = User.find_by_id(params[:user_id])
    @bancbox_investor = @user.bancbox_investor
    @transaction = Bancbox::FundTransaction.new(params[:bancbox_fund_transaction])
    @transaction.investor = @bancbox_investor
    if @transaction.valid?
      unless params[:bancbox_bank_account].nil?
        @bank_account = Bancbox::BankAccount.new(params[:bancbox_bank_account])
        @bank_account.investor = @bancbox_investor
        if @bank_account.valid?
          @bancbox_investor.fund_account_and_link_bank!(:investor, @transaction, @bank_account)
        else
          render :new_fund
          return
        end
      else
        @bancbox_investor.fund_account!(:investor, @transaction)
      end
      redirect_to user_bancbox_investor_path(@user), :flash => {:success => 'Fund Account successfully.' }
    else
      render :new_fund
    end
  end

  def bank_account
    @user = User.find_by_id(params[:user_id])
    @bancbox_investor = @user.bancbox_investor
    @bank_account = Bancbox::BankAccount.new(params[:bancbox_bank_account])
    @bank_account.investor = @bancbox_investor
    if @bank_account.valid?
      @bancbox_investor.link_bank_account(:investor, @bank_account)
      redirect_to user_bancbox_investor_path(@user), :flash => {:success => 'Link Bank Account successfully.' }
    else
      render :new_bank_account
      return
    end
  end
end
