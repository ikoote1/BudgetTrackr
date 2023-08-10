Rails.application.routes.draw do
  resources :items
  resources :categories
  devise_for :users
  root to: "splash#index"

  get "categories" , to: "categories#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
