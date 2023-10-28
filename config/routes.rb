Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :pets do
    resources :orders, only: [:new, :create]
  end
  get "my_pets", to: "pets#my_pets_index", as: "my_pets"
  get "my_orders", to: "orders#my_orders_index", as: "my_orders"
  resources :orders, only: [:index, :update, :destroy]
end
