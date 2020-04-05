Rails.application.routes.draw do
  get 'toppages/index'
  root to: 'tasks#index'
  resources :tasks

  resources :users, only: [:new, :create]
  get 'signup', to: 'users#new'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
end
