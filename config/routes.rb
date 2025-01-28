Rails.application.routes.draw do
  devise_for :users
  root to: "submarines#index"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :submarines, only: [:index, :show] do
    resources :bookings, only: [:new, :create], path: "bookings"
  end

  resources :bookings, only: :index

end
