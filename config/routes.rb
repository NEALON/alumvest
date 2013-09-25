Av::Application.routes.draw do

  # mount RailsAdmin::Engine => '/data', :as => 'rails_admin'

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
      resources :jobs
      resources :display_updates
      resources :display_jobs
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
  end

  resources :users do
    resource :borrower
    resource :investor
  end

  root :to => "home#index"
end
