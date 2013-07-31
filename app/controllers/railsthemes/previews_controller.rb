class Railsthemes::PreviewsController < ApplicationController
  def show
    if params[:name]
      render :template => File.join('railsthemes', 'previews', params[:name])
    else
      redirect_to :action => 'index'
    end
  end

  def partial
    if params[:feature] && params[:partial]
      render :template => File.join('railsthemes', 'previews', params[:feature], "_#{params[:partial]}"), :layout => 'application'
    else
      redirect_to :action => 'index'
    end
  end

  def current_layout
    send(:_layout)
  end

  helper_method :current_layout
end
