Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :pets do
    resources :oders, only: [:new, :create]
  end
  resources :orders, only: [:index, :update, :destroy]
end
