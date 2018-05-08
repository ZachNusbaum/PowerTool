Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  namespace :news do
    resources :top_stories, only: [:index, :show]
  end
  namespace :parsers do
    resources :gym_logs, only: [:new, :create]
  end
  namespace :users do
    resources :email_logs, only: [:index]
  end
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: "pages#root"
end
