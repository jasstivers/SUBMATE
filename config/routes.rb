Rails.application.routes.draw do
  get 'landing/index'

  root to: "landing#index"

  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  # Submarines routes with nested bookings
  resources :submarines, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:new, :create, :index], path: "bookings"  # Nested bookings with index action
  end

  resources :bookings, only: [:index] do
    member do
      patch :confirm
      patch :reject
    end
  end
end
