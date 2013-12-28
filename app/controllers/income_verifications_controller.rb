class IncomeVerificationsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @investor = @user.investor
    @income_verification = Veritax::Order.new(:investor => @investor)
    render :layout => 'investors'
  end

  def create
    @user = User.find(params[:user_id])
    @investor = @user.investor
    @income_verification = Veritax::Order.create(params[:veritax_order])
    if @income_verification.valid?
      redirect_to user_investor_income_verification_path(@user), flash: {success: 'Your information was saved.'}
    else
      render action: :new, layout: 'investors'
    end
  end

  def show
    @user = User.find(params[:user_id])
    @investor = @user.investor
    @income_verification = @user.investor.income_verification
    render :layout => 'investors'
  end
end

