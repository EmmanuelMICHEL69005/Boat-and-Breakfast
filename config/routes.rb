Rails.application.routes.draw do
  get 'boats/index'
  get 'boats/new'
  get 'boats/show'
  get 'boats/create'
  get 'boats/upade'
  devise_for :users
  root to: 'pages#home'
  resources :boats
  resources :users
  resources :bookings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
