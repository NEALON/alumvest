class DemographicsController < ApplicationController
  def show
    @user = User.find_by_id(params[:user_id])
    @demographic = @user.demographic || Demographic.create(:user => @user)
  end

  def edit
    @user = User.find_by_id(params[:user_id])
    @demographic = @user.demographic
  end
  
  def update
    @user = User.find(params[:user_id])
    @demographic = @user.demographic
    @demographic.update_attributes(params[:demographic])
    if @demographic.valid?
      redirect_to user_demographic_path(@user), :flash => {:success => 'Demographic info saved.' }
    else
      render :edit
    end
  end
end
