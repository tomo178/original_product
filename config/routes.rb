Rails.application.routes.draw do
  get 'posts/edit'
  get 'products', to: 'products#index'
  get 'home', to: 'home#index'
  get 'base/authorize', to: 'base#authorize'
  get 'base/get_items', to: 'base#get_items'
  root 'home#index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
