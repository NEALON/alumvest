Av::Application.routes.draw do

  get 'investor_dashboard/index'
  resources :envelopes do
    get :record_event
    get :signed_document
  end

  mount RailsAdmin::Engine => '/data', :as => 'rails_admin'

  match '/auth/:provider/callback', :to => 'sessions#create', :via => [:get, :post]
  get '/auth/failure', :to => 'sessions#failure'
  match '/logout', :to => 'sessions#destroy', :as => 'logout', :via => :delete

  get '/issuer_dashboard', :to => 'issuer_dashboard#index'
  get '/issuer_dashboard/create_campaign', :to => 'issuer_dashboard#create_campaign'

  get '/tester_dashboard', :to => 'tester_dashboard#index'
  get '/tester_dashboard/reset_database', :to => 'tester_dashboard#reset_database', :via => :get

  get 'home/index'

  match '/about', :to => 'content_page#index', :via => [:get]
  match '/about/team', :to => 'content_page#team', :via => [:get]
  match '/about/contact', :to => 'content_page#contact', :via => [:get]

  resources :sessions
  resources :identities

  resources :campaigns do
    resource :company do
      get :check_for_completeness
      get :preview
      get :display
      resources :updates
      resources :jobs
      resources :display_updates
      resources :display_jobs
    end

    resource :team do
      get :check_for_completeness
      get :preview
      get :display
    end

    resource :investment_term do
      get :check_for_completeness
      get :preview
      get :display
    end

    resources :investments do
      resource :funding_xn
      get :investor_verification
      resource :identity_verification
      resource :contract_doc_group
      resource :subscription_agreement
      put :submit_for_review
    end
    post :submit_for_review
    post :follow
    post :unfollow
  end

  resources :users do
    resource :borrower
    resource :investor do
      resources :events, :controller => 'investor_events'
      resource :income_verification do
        put :submit_to_veritax
      end
    end
    resource :bank_account
    resource :settings

    resource :bancbox_investor do
      get :new_fund
      get :new_bank_account
      post :fund
      post :bank_account
    end

    resource :admin do
      get :income_verification_events
      get :investor_signings
      get :simulate_completed_order
      get :simulate_canceled_order
      get :income_verification_transcript
      post :approve_investor_signing
      post :reject_investor_signing
    end

    resource :issuer do
      resources :events, :controller => 'issuer/events'
      resources :campaigns, :controller => 'issuer/campaigns'
      resources :signings, :controller => 'issuer/signings'
    end

    resource :bancbox_identity_verification
  end

  post 'common/filepicker'

  root :to => 'home#index'
end
