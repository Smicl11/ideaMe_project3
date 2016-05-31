Rails.application.routes.draw do

  #user routes
  root to: "users#index"
  resources :users

  #Sessions
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"

  #Idea routes
  resources :ideas
end
