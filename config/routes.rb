Av::Application.routes.draw do

  get "investor_dashboard/index"
  resources :envelopes do
    get :record_event
    get :signed_document
  end

  mount RailsAdmin::Engine => '/data', :as => 'rails_admin'

  match '/auth/:provider/callback', :to => 'sessions#create', :via => [:get, :post]
  get '/auth/failure', :to => 'sessions#failure'
  match '/logout', :to => 'sessions#destroy', :as => 'logout', :via => :delete

  get '/admin_dashboard', :to => "admin_dashboard#index"
  match '/admin_dashboard/approve_investor_signing', :to => 'admin_dashboard#approve_investor_signing', :via => :post
  match '/admin_dashboard/reject_investor_signing', :to => 'admin_dashboard#reject_investor_signing', :via => :post

  get '/owner_dashboard', :to => "owner_dashboard#index"

  get '/investor_dashboard', :to => "investor_dashboard#index"

  get "home/index"

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

    resources :investment_finalizations do
      resource :payment_information
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
    resource :demographic
    resource :borrower
    resource :investor
    resource :settings
    namespace :banking do
      resource :identity
      resource :account do
        namespace :bancbox do
          resource :account
          resources :transactions
          resources :deposits
          resources :withdrawals
        end
      end
    end
    resource :bancbox_investor do
      get :new_fund
      get :new_bank_account
      post :fund
      post :bank_account
    end
    resource :bancbox_issuer
    resource :bancbox_identity_verification
  end

  post "common/filepicker"

  root :to => "home#index"
end
