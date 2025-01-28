Rails.application.routes.draw do
  devise_for :users
  root to: "submarines#index"

  get "up" => "rails/health#show", as: :rails_health_check

  # Submarines routes with nested bookings
  resources :submarines, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create, :index], path: "bookings"  # Nested bookings with index action
  end

  resources :bookings, only: :index

end
