Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}

  get 'post/login'

  resources :relationships
  resources :users do
  	member do
  		get :following, :followers
  	end
  end
  resources :posts do
    resources :comments
  end
  resources :jobs
  resources :rankings
  resources :pages
  
  root 'pages#login'

  get '/home' => 'pages#home'
  get '/user/:id' => 'pages#profile'
  get '/explore' => 'pages#explore'
  get '/index' => 'pages#index'
  get '/login' => 'pages#login'
  
  # For custom jobs index paths
  post '/jobs' => 'jobs#create'
  post '/rankings/new' => 'rankings#new'
end
