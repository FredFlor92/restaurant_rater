Rails.application.routes.draw do
  
  resources :categories
  root 'sessions#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
 
  resources :companies
  resources :reviews

  resources :restaurants do
    resources :companies, only: [:new, :index]
  end 
  resources :categories
  resources :users, only: [:show]

  get '/very_popular' => 'restaurants#very_popular'

  get '/auth/google_oauth2/callback' => 'sessions#omniauth'
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
