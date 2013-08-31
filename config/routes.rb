Av::Application.routes.draw do

  mount RailsAdmin::Engine => '/data', :as => 'rails_admin'

  # omniauth identity stuff
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'
  match '/logout', :to => 'sessions#destroy', :as => 'logout'

  get "home/index"

  resources :sessions
  resources :identities

  resources :companies do
    resources :updates
    get :join_us

    get :submit_for_review

    resource :team do
      get :submit_for_review
    end

    resource :investment_term do
      get :submit_for_review
    end
  end

  resources :campaigns, :only => :show do
    get :team
    get :investment_term
    get :updates
    get :join_us
  end
  resources :users

  ### Begin RailsThemes basic generated routes ###

  # Routes to RailsThemes Theme Example markup:
  namespace :railsthemes do
    match '/' => 'railsthemes#index'
    match '/previews', controller: :previews, action: :index
    match '/previews/:name', controller: :previews, action: :show
    match '/previews/:feature/:partial', controller: :previews, action: :partial
    match '/:action', controller: :railsthemes
  end

  # This is magical routing for errors (instead of using the static markup in
  # public/*.html)
  match '/403', to: 'railsthemes_errors#403_forbidden'
  match '/404', to: 'railsthemes_errors#404_not_found'
  match '/500', to: 'railsthemes_errors#500_internal_server_error'

  ### End RailsThemes basic generated routes ###
  root :to => "home#index"
end
