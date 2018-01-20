Rails.application.routes.draw do
  devise_for :users

  resources :relationships
  resources :users do
  	member do
  		get :following, :followers
  	end
  end
  resources :posts
  
  root 'pages#index'

  get '/home' => 'pages#home' # overrides default route
  get '/user/:id' => 'pages#profile'
  get '/explore' => 'pages#explore'
  get '/index' => 'pages#index'
end
