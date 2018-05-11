Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  namespace :charges do
    resources :money_requests, only: [:new, :create, :show] do
      resources :payments, only: [:create]
    end
  end
  namespace :document do
    resources :deliveries, only: [:new, :create, :show]
  end
  namespace :news do
    patch 'email_toggle', to: 'top_stories#email_opt_in_toggle'
    resources :top_stories, only: [:index, :show]
  end
  namespace :parsers do
    resources :gym_logs, only: [:new, :create]
  end
  namespace :users do
    resources :email_logs, only: [:index]
    resources :events, only: [:index]
  end
  scope :auth do
    get '/', to: 'users/automatic_logins#new', as: 'auto_login'
  end
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'
  mount Sidekiq::Web => '/sidekiq'
  #mount PolicyManager::Engine => "/policies"

  root to: "pages#root"
end
