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
    unless @bancbox_investor.created?
      @bancbox_investor.create!
    end
    if @bancbox_investor.valid?
      redirect_to user_bancbox_investor_path(@user), :flash => {:success => 'Bancbox investor info saved.' }
    else
      render :edit
    end
  end
end
