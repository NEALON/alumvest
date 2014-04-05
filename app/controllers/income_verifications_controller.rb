class IncomeVerificationsController < ApplicationController

  def new
    @user = UserBase.find(params[:user_id])
    @investor = @user.investor
    @income_verification = Veritax::Order::Base.new(:investor => @investor,
                                              :ssn => @user.ssn,
                                              :first_name => @user.first_name,
                                              :last_name => @user.last_name,
                                              :address => @user.address,
                                              :city => @user.city,
                                              :state => @user.state,
                                              :zip_code => @user.zipcode,
                                              :email => @user.email)
    authorize! :manage, @income_verification
    render :layout => 'investors'
  end

  def create
    @user = UserBase.find(params[:user_id])
    @investor = @user.investor
    @income_verification = Veritax::Order::Base.create(params[:veritax_order_base])
    authorize! :manage, @income_verification
    if @income_verification.valid?
      redirect_to user_investor_income_verification_path(@user), :flash => {:success => 'Your information was saved.'}
    else
      render :action => :new, :layout => 'investors'
    end
  end

  def edit
    load_income_verification
    render :action => 'new', :layout => 'investors'
  end

  def update
    load_income_verification
    @income_verification.update_attributes(params[:veritax_order_base])
    if @income_verification.valid?
      redirect_to user_investor_income_verification_path(@user), :flash => {:success => 'Your information was saved.'}
    else
      render :action => :new, :layout => 'investors'
    end
  end

  def submit_to_veritax
    load_income_verification
    @income_verification.create_via_veritax!
    if @income_verification.reload.submitted?
      redirect_to user_investor_events_path(@user), :flash => {:success => "Your information was successfully submitted to Veri-Tax (Order id: #{@income_verification.vt_order_id}). Please check your inbox for your e-signable form and note the instructions regarding the document password."}
    else
      redirect_to edit_user_investor_income_verification_path(@user, @income_verification), :flash => {:warning => "An error was encounteredd while trying to process your order: #{@income_verification.vt_error})."}
    end
  end

  def show
    load_income_verification
    render :layout => 'investors'
  end

  private

  def load_income_verification
    @user = UserBase.find(params[:user_id])
    @investor = @user.investor
    @income_verification =  @investor.income_verification
    authorize! :manage, @income_verification
  end
end

