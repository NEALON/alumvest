class IncomeVerificationsController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @investor = @user.investor
    @income_verification = Veritax::Order.new(investor: @investor,
                                              ssn: @user.ssn,
                                              first_name: @user.first_name,
                                              last_name: @user.last_name,
                                              address: @user.address,
                                              city: @user.city,
                                              state: @user.state,
                                              zip_code: @user.zipcode,
                                              email: @user.email)
    render layout: 'investors'
  end

  def create
    @user = User.find(params[:user_id])
    @investor = @user.investor
    @income_verification = Veritax::Order.create(params[:veritax_order].merge(status: 'unsubmitted'))
    if @income_verification.valid?
      redirect_to user_investor_income_verification_path(@user), flash: {success: 'Your information was saved.'}
    else
      render action: :new, layout: 'investors'
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @investor = @user.investor
    @income_verification = @investor.income_verification
    render action: 'new', layout: 'investors'
  end

  def update
    @user = User.find(params[:user_id])
    @investor = @user.investor
    @income_verification =  @investor.income_verification
    @income_verification.update_attributes(params[:veritax_order])
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
    render layout: 'investors'
  end
end

