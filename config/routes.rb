Rails.application.routes.draw do
  namespace :parsers do
    resources :gym_logs, only: [:new, :create]
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "pages#root"
end
