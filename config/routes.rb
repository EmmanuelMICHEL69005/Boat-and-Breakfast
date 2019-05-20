Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :boats, only: [ :index, :show, :new, :create ] do
    resources :bookings, only: [ :new, :create]
  end
  resources :bookings, only: [:destroy]
  resources :boats, only: [:destroy]
end
