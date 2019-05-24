Rails.application.routes.draw do
  # get 'reviews/new'
  # get 'reviews/create'
  devise_for :users
  root to: 'pages#home'
  resources :boats do
    resources :reviews, only: [:create]
  end
  resources :users
  resources :bookings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
