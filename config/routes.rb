Rails.application.routes.draw do

  namespace :users do
    get 'services/index'
    get 'two_factor', to: 'two_factor#show'
    post 'two_factor', to: 'two_factor#enable'
  end

  namespace :utilities do
    resources :signature_requests, only: [:index, :new, :create, :show] do
      patch '/submit', to: 'signature_requests#submit'
    end
  end
  # Add routes for the doorkeeper gem
  use_doorkeeper do
    controllers :applications => 'oauth/applications'
  end

  # Add routes for the admin panel
  ActiveAdmin.routes(self)
  namespace :charges do
    resources :money_requests, only: [:new, :create, :show] do
      resources :payments, only: [:create]
    end
  end

  # Document related routes
  namespace :document do
    resources :deliveries, only: [:new, :create, :show]
  end

  # News Related Routes
  namespace :news do
    patch 'email_toggle', to: 'top_stories#email_opt_in_toggle'
    resources :top_stories, only: [:index, :show] do
      post 'bookmark', on: :member, to: 'bookmarks#create'
    end
    resources :sources, only: [:index, :show]
  end

  # RegEx parser routes
  namespace :parsers do
    resources :gym_logs, only: [:new, :create]
  end

  # User (namespaced) routes
  namespace :users do
    resources :email_logs, only: [:index]
    resources :events, only: [:index]
    resources :services, only: [:index]
  end

  # User (non-namespaced) routes
  scope :users do
    get 'bookmarks/stories', to: 'news/bookmarks#index'
    delete 'bookmarks/stories/:id', to: 'news/bookmarks#destroy', as: 'remove_story_bookmark'
  end

  # Routes for auto-login links
  scope :auth do
    get '/', to: 'users/automatic_logins#new', as: 'auto_login'
  end

  namespace :words do
    scope :adjectives do
      get '/', to: 'adjectives#new', as: 'find_adjectives'
      get '/result', to: 'adjectives#show', as: 'adjectives_results'
    end

    scope :triggers do
      get '/', to: 'triggers#new', as: 'find_triggers'
      get '/result', to: 'triggers#show', as: 'triggers_results'
    end
  end

  namespace :emails do
    post '/incoming', to: 'incoming#create'
    scope :dmarc do
      get '/', to: 'dmarc_accounts#index', as: 'dmarc_accounts'
      post '/', to: 'dmarc_accounts#create', as: 'dmarc'
      get '/new', to: 'dmarc_accounts#new', as: 'new_dmarc_account'
      get '/:account_id', to: 'dmarc_accounts#show', as: 'dmarc_account'
      get '/:account_id/reports/:report_id', to: 'dmarc_reports#show',
        as: 'dmarc_report'
    end
  end

  # Routes for devise
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Background process manager
  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  
  # Terms of Service
  get '/terms', to: 'pages#terms'
  # Privacy Policy
  get '/privacy', to: 'pages#privacy_policy'
  root to: "pages#root"


  namespace :api do
    namespace :v1 do
      scope :news do
        get 'bookmarks', to: 'news#bookmarks'
      end

      scope :signatures do
        get '/:uuid', to: 'signatures#show'
        post '/', to: 'signatures#create'
      end
    end
  end
end
