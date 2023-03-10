Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/my_dashboard', to: 'pages#index', as: 'my_dashboard'
  get '/my_bookings', to: 'bookings#my_bookings', as: 'my_bookings'
  get '/my_sittings', to: 'bookings#my_sittings', as: 'my_sittings'
  get '/my_past_bookings', to: 'bookings#my_past_bookings', as: 'my_past_bookings'

  resources :bookings, only: [:create, :index] do
    resources :reviews, only: [:new, :create]
  end

  resources :users, only: [:show]

  get '/my_profile', to: 'users#show', id: 'current'

  # Defines the root path route ("/")
  resources :petsitters, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create, :show, :edit, :update, :destroy]
  end
end
