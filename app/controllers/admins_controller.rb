require_relative '../../spec/veritax_orders'

class AdminsController < ApplicationController
  include VeritaxOrders # for simulating responses

  def show
    @user = User.find(params[:user_id])
    render :layout => 'admins'
  end

  def income_verification_events
    @user = User.find(params[:user_id])
    # TODO: merging and sorting these events
    # TODO: event filtering
    @order_submitted_successfully_events = Bus::Event::Veritax::OrderSubmittedSuccessfully.all.order('id desc')
    @order_completed_events = Bus::Event::Veritax::OrderCompleted.all.order('id desc')
    render :layout => 'admins'
  end

  def simulate_completed_order
    order = Veritax::Order.find(params[:veritax_order_id])
    order.update_attribute(:vt_order_id, CompletedOrderId)
    order.get_order_info!

    redirect_to income_verification_events_user_admin_path(current_user)
  end

  def simulate_canceled_order
    order = Veritax::Order.find(params[:veritax_order_id])
    order.update_attribute(:vt_order_id, CanceledOrderId)
    order.get_order_info!

    redirect_to income_verification_events_user_admin_path(current_user)
  end
end

