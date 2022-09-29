Rails.application.routes.draw do
  
    
  # Model leave
  resources :leave
  get 'leave/index', to: 'leave#index'
  post 'leave/new', to: 'leave#create'

  # Model User
  resources :users
  resources :sessions
  get 'logout', to: 'sessions#destroy', as: 'logout'


  root to: "sessions#new"
end
