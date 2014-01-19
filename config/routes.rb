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

  get '/admin_dashboard', :to => 'admin_dashboard#index'
  match '/admin_dashboard/approve_investor_signing', :to => 'admin_dashboard#approve_investor_signing', :via => :post
  match '/admin_dashboard/reject_investor_signing', :to => 'admin_dashboard#reject_investor_signing', :via => :post

  get '/owner_dashboard', :to => 'owner_dashboard#index'
  get '/owner_dashboard/create_campaign', :to => 'owner_dashboard#create_campaign'

  get '/investor_dashboard', :to => 'investor_dashboard#index'

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
      resource :funding_level
      resource :questionnaire
      resource :identity_verification
      resource :contract_doc_group
      resource :subscription_agreement
      resource :irs_doc_group
      put :submit_for_review
    end
    post :submit_for_review
    post :follow
    post :unfollow
  end

  resources :users do
    resource :borrower
    resource :investor do
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
    resource :bancbox_identity_verification
  end

  post 'common/filepicker'

  root :to => 'home#index'
end
