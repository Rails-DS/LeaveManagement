Rails.application.routes.draw do
  

  resources :teams
  

  # Model leave
  resources :leave
  get 'leave/index', to: 'leave#index'
  post 'leave/new', to: 'leave#create'
  get 'leave_request', to: 'users#leave_request'

  # Model User
  resources :sessions
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users do
    member do
      get :toggle_status
      get :status_rejected
    end
  end

  root to: "sessions#new"
end
