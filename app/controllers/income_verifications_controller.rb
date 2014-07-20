class IncomeVerificationsController < ApplicationController

  def new
    @user = Alumvest::UserBase.find(params[:user_id])
    @investor = @user.investor
    @income_verification = Veritax::OrderBase.new(:investor => @investor,
                                              :ssn => @user.ssn,
                                              :first_name => @user.first_name,
                                              :last_name => @user.last_name,
                                              :address => @user.address,
                                              :city => @user.city,
                                              :state => @user.state,
                                              :zip_code => @user.zipcode,
                                              :email => @user.email)
    authorize! :manage, @income_verification
  end

  def create
    @user = Alumvest::UserBase.find(params[:user_id])
    @investor = @user.investor
    @income_verification = Veritax::OrderBase.create(params[:veritax_order_base])
    authorize! :manage, @income_verification
    if @income_verification.valid?
      redirect_to user_investor_income_verification_path(@user), :flash => {:success => 'Your information was saved.'}
    else
      render :action => :new
    end
  end

  def edit
    load_income_verification
    render :action => 'new'
  end

  def update
    load_income_verification
    @income_verification.update_attributes(params[:veritax_order_base])
    if @income_verification.valid?
      redirect_to user_investor_income_verification_path(@user), :flash => {:success => 'Your information was saved.'}
    else
      render :action => :new
    end
  end

  def submit_to_veritax
    load_income_verification
    @income_verification.create_via_veritax!
    if @income_verification.reload.submitted?
      redirect = params[:redirect]
        if  redirect == 'payment'
         redirect_to campaign_investment_path( params[:campaign_id],params[:investment_id])
        else
          redirect_to user_investor_events_path(@user), :flash => {:success => "Your information was successfully submitted to Veri-Tax (Order id: #{@income_verification.vt_order_id}). Please check your inbox for your e-signable form and note the instructions regarding the document password."}
        end
    else
      redirect_to edit_user_investor_income_verification_path(@user, @income_verification), :flash => {:warning => "An error was encounteredd while trying to process your order: #{@income_verification.vt_error})."}
    end
  end

  def show
    puts params.inspect
    load_income_verification
    @redirect = params[:redirect]
    @campaign_id = params[:campaign_id]
    @investment_id = params[:investment_id]
  end

  private

  def load_income_verification
    @user = Alumvest::UserBase.find(params[:user_id])
    @investor = @user.investor
    @income_verification =  @investor.income_verification
    if  !@income_verification
       @income_verification = Veritax::OrderBase.new(:investor => @investor,
                                              :ssn => @user.ssn,
                                              :first_name => @user.first_name,
                                              :last_name => @user.last_name,
                                              :address => @user.address,
                                              :city => @user.city,
                                              :state => @user.state,
                                              :zip_code => @user.zipcode,
                                              :email => @user.email)
    end
    #authorize! :manage, @income_verification
  end
end

