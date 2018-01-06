Rails.application.routes.draw do
  root 'pages#index'

  get '/home' => 'pages#home' # overrides default route
  get '/profile' => 'pages#profile'
  get '/explore' => 'pages#explore'
end
