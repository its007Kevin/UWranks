Rails.application.routes.draw do
  devise_for :users, :controllers => {:sessions => "sessions"}

  resources :feedbacks
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
  resources :conversations, only: [:create] do
    member do
      post :close
    end

    resources :messages, only: [:create]
  end

  resources :notifications do
    collection do
      post :mark_as_read
    end
  end

  root 'pages#sign_up'

  get '/home' => 'pages#home'
  get '/explore' => 'pages#explore'
  get '/user/:id' => 'pages#profile'
  get '/index' => 'pages#index'
  get '/conversations' => 'inbox#index'
  get '/help' => 'pages#help'
  get '/messages' => 'messages#index'

  # For custom jobs index paths
  post '/jobs' => 'jobs#create'
  post '/rankings/new' => 'rankings#new'
end
