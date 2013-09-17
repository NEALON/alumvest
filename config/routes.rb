Av::Application.routes.draw do

  mount RailsAdmin::Engine => '/data', :as => 'rails_admin'

  # omniauth identity stuff
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'
  match '/logout', :to => 'sessions#destroy', :as => 'logout'

  get "home/index"

  resources :sessions
  resources :identities

  resources :campaigns do
    resource :company do
      get :check_for_completeness
      get :display
      resources :updates
      resources :display_updates
    end
    resource :team do
      get :check_for_completeness
      get :display
    end
    resource :investment_term do
      get :check_for_completeness
      get :display
    end
    resources :investments
    post :submit_for_review
    get :join_us
  end

  resources :users

  root :to => "home#index"
end
