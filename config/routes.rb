Rails.application.routes.draw do
  devise_for :users

  root to: "books#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :books, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :bookings, only: [:new, :create]
  end

  resources :users, only: [:show, :edit, :update]

  resources :bookings, only: [:index, :edit, :update, :destroy]
end
