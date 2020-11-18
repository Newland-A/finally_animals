Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create' 
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get '/auth/:provider/callback', to: 'sessions#create_with_omni'
  
  get 'contact', to: 'companies#show', as: 'contact'

  resources :sessions, only: [:new, :create, :destroy]

  resources :users do
    resources :animals
  end

  resources :animals 

end
