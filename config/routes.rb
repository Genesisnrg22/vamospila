Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :services do
    resources :line_items, only: [:new, :create]
  end

  resources :line_items, only: [:index, :destroy]
  # Defines the root path route ("/")
  # root "posts#index"

  #post "line_items", to: "line_items#create"
end
