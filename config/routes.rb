Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'posts/edit'
  get 'products' => 'products#index'
  get 'home' => 'home#index'
  get 'base/request_authorize' => 'base#request_authorize'
  get 'base/authorize' => 'base#authorize'
  get 'base/get_items' => 'base#get_items'
  get  "/signup" => "users#new"
  get    "/login" => "sessions#new"
  post   "/login" => "sessions#create"
  post 'fetch_base_products' => 'base#get_items'
  delete "/logout" => "sessions#destroy"
  root 'home#index'
  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
