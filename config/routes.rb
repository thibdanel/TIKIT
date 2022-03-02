Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :services
    # resources :user_service, only: [:new, :create]

  resources :user_services, only: [:destroy, :update, :edit] do
    resources :tasks, only: [:new, :create ]
  end

  resources :tasks, only: [:edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
