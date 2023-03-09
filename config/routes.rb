Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/my_bookings', to: 'bookings#my_bookings', as: 'my_bookings'

  resources :bookings, only: [:create, :index]

  resources :users, only: [:show]


  get '/my_profile', to: 'users#show', id: 'current'
  # Defines the root path route ("/")
  resources :petsitters, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:create, :show, :edit, :update, :destroy] do
      resources :reviews, only: [:show, :index, :new, :create]
    end
  end
end
