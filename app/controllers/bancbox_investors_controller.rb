class BancboxInvestorsController < ApplicationController

  def show
    @user = User.find_by_id(params[:user_id])
    @bancbox_investor = @user.bancbox_investor || Bancbox::Investor.create(:user => @user)
  end

  def edit
    @user = User.find_by_id(params[:user_id])
    @bancbox_investor = @user.bancbox_investor
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
    render :new_fund
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
end
