Rails.application.routes.draw do
  get 'users/index'
  root to:"posts#home"
  get 'posts/home'
  devise_for :users
  get "/new", to:"posts#new"
  post "/create", to:"posts#create"
  get "/users/sign_out", to:"tweets#logout"
  get "/users/:id", to:"users#user_page"
  delete "/posts/:id", to:"users#destroy"
  get "/posts/:id", to:"posts#show"

  resources :users
  resources :posts, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create, :destroy]
  end

end