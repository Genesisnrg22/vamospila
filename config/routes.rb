Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  delete "line_items/:item_id", to: "line_items#destroy", as: :line_item
  delete "carts/:cart_id", to: "carts#destroy", as: :cart
  get "/services/search", to: "services#search"

  resources :services do
    resources :line_items, only: [:new, :create]
    resources :reviews, only: [:index, :new, :create]
  end
    resource :reviews, only: [:show, :edit, :update, :destroy]

  resources :line_items do
    resource :orders, only: [:update]
  end

  resources :line_items, only: [:index]

  resources :carts, only: [:show] do
    resources :orders, only: [:new]
  end
  # Defines the root path route ("/")
  # root "posts#index"
  post "line_items/minus", to: "line_items#minus"
  post "line_items/add", to: "line_items#add"
  get '/users/:id/profile', to: 'users#profile', as: 'user_profile'
  resources :orders, only: [:create, :show]
  get "orders", to: "orders#user_orders", as: "user_orders"


end
