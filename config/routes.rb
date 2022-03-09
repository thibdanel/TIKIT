Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  #require "sidekiq/web"

  resources :services do
    resources :user_services, only: [:new, :create]
  end

  resources :user_services, only: [:destroy, :update, :edit, :show, :index] do
    resources :tasks, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :tasks, only: [:edit, :update, :destroy, :index, :new, :create]

  patch "tasks/:id/finished", to: 'tasks#finished', as: "task_finished"

  resources :service_tasks, only: [:index, :new, :create]

  # Sidekiq Web UI, only for admins.

  # authenticate :user, ->(user) { user.admin? } do
  #   mount Sidekiq::Web => '/sidekiq'
  # end

  # commented routes for checking in the future

  # resources :services, only: [:new, :create] #possible d'ajouter suppression update !!!!!!
  #   # resources :user_service, only: [:new, :create]

  # resources :user_services, only: [:destroy, :update, :edit, :show] do
  #   resources :tasks, only: [:new, :create ]
  # end

  # resources :tasks, only: [:edit, :update, :destroy, :index]
  # # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
