class Railsthemes::RailsthemesController < ApplicationController
  before_filter :set_flash_messages, :only => ["standard_markup-flash_messages"]

  def send_email_one_column
    RailsthemesMailer.test_email_one_column(:to => params[:email]).deliver
    flash.now[:notice] = "The preview email has been sent."
    render 'index'
  end

  def send_email_two_column
    RailsthemesMailer.test_email_two_column(:to => params[:email]).deliver
    flash.now[:notice] = "The preview email has been sent."
    render 'index'
  end

  def set_flash_messages
    flash.now[:alert] = "This is a standard rails alert"
    flash.now[:notice] = "This is a standard rails notice"
  end
end
