Rails.application.routes.draw do
   resources :leave
  get 'leave/index', to: 'leave#index'
  post 'leave/new', to: 'leave#create'

  resources :users
  resources :sessions
  get 'logout', to: 'sessions#destroy', as: 'logout'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "users#new"
end
