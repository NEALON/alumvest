class DemographicsController < ApplicationController
  def show
    @user = User.find_by_id(params[:user_id])
    @demographic = @user.demographic || Demographic.create(:user => @user)
    @active = 'demographic_info'
    render :layout => "users"
  end

  def edit
    @user = User.find_by_id(params[:user_id])
    @demographic = @user.demographic
    @active = 'demographic_info'
    render :layout => "users"
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
