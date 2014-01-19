class AdminsController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    render :layout => 'admins'
  end

  def income_verification_events
    @user = User.find(params[:user_id])
    @order_completed_events = Bus::Event::Veritax::OrderCompleted.all.order('id desc')
    render :layout => 'admins'
  end
end

