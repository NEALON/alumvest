class BancboxInvestorsController < ApplicationController
  def show
    @user = User.find_by_id(params[:user_id])
    @bancbox_investor = @user.bancbox_investor || BancboxInvestor.create(:user => @user)
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
end
