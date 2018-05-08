Rails.application.routes.draw do
  namespace :news do
    resources :top_stories, only: [:index, :show]
  end
  namespace :parsers do
    resources :gym_logs, only: [:new, :create]
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  require 'sidekiq/web'
  require 'sidekiq-scheduler/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: "pages#root"
end
