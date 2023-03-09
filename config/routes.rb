Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/my_bookings', to: 'bookings#my_bookings', as: 'my_bookings'
  get '/my_sittings', to: 'bookings#my_sittings', as: 'my_sittings'

  resources :bookings, only: [:create, :index] do
    resources :reviews, only: [:new]
  end
  
  resources :reviews
  resources :users, only: [:index, :show]

  get '/my_profile', to: 'users#show', id: 'current'

  # Defines the root path route ("/")
  resources :petsitters, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create, :show, :edit, :update, :destroy]
  end
end
