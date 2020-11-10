Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :animals
  delete '/animals/:id', to: "users#destroy"
  resources :companies
  
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create' 
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get '/auth/facebook/callback', to: 'sessions#create_with_omni'
  get '/auth/github/callback', to: 'sessions#create_with_omni'
  get '/auth/google/callback', to: 'sessions#create_with_omni'
  # scope :animals do 
  #   resources :users
  # end
end
