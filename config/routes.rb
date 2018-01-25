Rails.application.routes.draw do
  devise_for :users

  get 'post/login'

  resources :relationships
  resources :users do
  	member do
  		get :following, :followers
  	end
  end
  resources :posts
  resources :jobs
  resources :rankings
  resources :pages
  
  root 'pages#login'

  get '/home' => 'pages#home'
  get '/user/:id' => 'pages#profile'
  get '/explore' => 'pages#explore'
  get '/index' => 'pages#index'
  get '/login' => 'pages#login'

  post '/rankings/new' => 'rankings#new'
end
