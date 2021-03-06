Rails.application.routes.draw do
  
  root 'sessions#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get 'auth/google_oauth2/callback', to: 'sessions#omniauth'
  get 'auth/failure', to: redirect('/')
 
  resources :reviews

  resources :restaurants do
    resources :reviews, only: [:new, :index, :create]
  end 
  
  resources :categories
  resources :users

  get '/very_popular' => 'restaurants#very_popular'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
