Rails.application.routes.draw do

  post 'login_user', to: "authentication#user_authenticate"
  post 'logout', to: "authentication#logout"

  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  resource :posts
  get "posts/index", to: "posts#index"
  
  resource :comments
end
