Rails.application.routes.draw do
  resources :categories, only: %i[index show new create] do
    resources :items, only: %i[new create]
  end
  devise_for :users
  root to: "splash#index"

  get "categories" , to: "categories#index", as: :custom_categories

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
