Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'posts/edit'
  get 'products', to: 'products#index'
  get 'home', to: 'home#index'
  get 'base/authorize', to: 'base#authorize'
  get 'base/get_items', to: 'base#get_items'
  get  "/signup",  to: "users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  root 'home#index'
  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
