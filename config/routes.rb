Av::Application.routes.draw do
  # Routes for Static pages
  get ':action' => 'static#:action'

  get 'reviews/accept'
  get 'reviews/reject'

  resources :envelopes do
    get :record_event
    get :signed_document
  end

  mount RailsAdmin::Engine => '/data', :as => 'rails_admin'

  match '/auth/:provider/callback', :to => 'sessions#create', :via => [:get, :post]
  get '/auth/failure', :to => 'sessions#failure'
  match '/logout', :to => 'sessions#destroy', :as => 'logout', :via => :delete

  get '/tester_dashboard', :to => 'tester_dashboard#index'
  get '/tester_dashboard/reset_database', :to => 'tester_dashboard#reset_database', :via => :get
  get '/tester_dashboard/promote_income_verifications', :to => 'tester_dashboard#promote_income_verifications', :via => :get

  get '/dashboard', :to => 'dashboard#index'

  match '/about', :to => 'content_page#index', :via => [:get]
  match '/about/team', :to => 'content_page#team', :via => [:get]
  match '/about/contact', :to => 'content_page#contact', :via => [:get]
  match '/about/privacy', :to => 'content_page#privacy', :via => [:get]
  match '/about/how-it-works', :to => 'static#howItWorks', :via => [:get]
  match '/about/how-it-works-investors', :to => 'static#howItWorksInvestors', :via => [:get]
  match '/about/how-it-works-process', :to => 'static#howItWorksProcess', :via => [:get] 
  #match '/about/how-it-works', :to => 'content_page#howItWorks', :via => [:get]
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

    resource :bancbox_escrow

    resources :investments do
      resource :online_payment do
        get :show
        get :wire_instructions
        resource :funding_xn
      end
      resource :offline_payment
      get :investor_verification
      get :payment_type
      put :update_payment_type
      resource :identity_verification
      resource :contract_doc_group
      resource :subscription_agreement
      put :submit_for_review
    end
    post :publish
    post :follow
    post :unfollow
  end

  resources :users do
    patch :update_education

    resource :bank_account
    resource :settings
    resource :account_info
    resource :notification_prefs, :only => [:edit, :update]

    resource :investor do
      get :dashboard
      resources :events, :controller => 'investor/events'
      resource :self_accredited_status
      resource :income_verification do
        put :submit_to_veritax
        get :new
      end
    end

    resource :issuer do
      resources :events, :controller => 'issuer/events'
      resource :campaign, :controller => 'issuer/campaigns' do
        resources :investments, :controller => 'issuer/investments'
      end
      resources :signings, :controller => 'issuer/signings'
    end

    resource :bancbox_investor do
      get :new_fund
      get :new_bank_account
      post :fund
      post :bank_account
    end

    # TODO: nest these resources
    resource :admin do
      get :income_verification_events
      get :campaign_events
      get :investor_signings
      get :completed_order
      get :cancel_order
      get :simulate_completed_order
      get :simulate_canceled_order
      get :income_verification_transcript
      get :bancbox_investments
      post :approve_investor_signing
      post :reject_investor_signing
      put :disable_campaign
      put :close_campaign
      put :cancel_campaign
      put :enable_campaign
      put :approve_income_verification
      put :reject_income_verification
      get :escrow_account
      put :update_escrow_account
      resources :campaigns do
        resource :review do
          post :accept
          post :reject
        end
      end
    end

    resource :bancbox_identity_verification
  end

  post 'common/filepicker'

  root :to => 'home#index'
end
