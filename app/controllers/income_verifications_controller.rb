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
    load_income_verification
    render action: 'new', layout: 'investors'
  end

  def update
    load_income_verification
    @income_verification.update_attributes(params[:veritax_order])
    if @income_verification.valid?
      redirect_to user_investor_income_verification_path(@user), flash: {success: 'Your information was saved.'}
    else
      render action: :new, layout: 'investors'
    end
  end

  def submit_to_veritax
    load_income_verification
    @income_verification.create_via_veritax!
    if @income_verification.reload.completed?
      redirect_to user_investor_events_path(@user), flash: {success: "Your information was successfully submitted to Veri-Tax (Order id: #{@income_verification.vt_order_id}). Please check your inbox for your e-signable form."}
    else
      redirect_to edit_user_investor_income_verification_path(@user, @income_verification), flash: {error: "An error was encounteredd while trying to process your order: #{@income_verification.vt_error})."}
    end
  end

  def show
    load_income_verification
    render layout: 'investors'
  end

  private

  def load_income_verification
    @user = User.find(params[:user_id])
    @investor = @user.investor
    @income_verification =  @investor.income_verification
  end
end

