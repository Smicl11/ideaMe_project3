Rails.application.routes.draw do

  #user routes
  root to: "users#index"
  get "/users", to: "users#index", as: "users"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create", as: "create_user"
  get "/users/:id", to: "users#show", as: "user"
  get "users/:id/edit", to: "users#edit", as:"user_edit"
  patch "/users/:id", to: "users#update", as: "update_user"
  delete '/users/:id', to: "users#destroy", as: "destroy_user"

  #Sessions
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"

  #Idea routes
  get "/ideas", to: "ideas#index", as: "ideas"
  get "/ideas/new", to: "ideas#new", as: "new_idea"
  post "/ideas", to: "ideas#create", as: "create_idea"
  get "/ideas/:id", to: "ideas#show", as: "idea"
  get "/ideas/:id/edit", to: "ideas#edit", as: "edit_idea"
  patch "/ideas/:id", to: "ideas#update", as: "update_idea"
  delete "/ideas/:id", to: "ideas#destroy", as: "delete_idea"

  #like/dislike idea routes
  put "/ideas/:id/like", to: "ideas#upvote", as: "like_idea"
  put "/ideas/:id/dislike", to: "ideas#downvote", as: "dislike_idea"


end
