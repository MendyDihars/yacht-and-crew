Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  resources :yachts, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:create]
  end
  resources :users, only: [] do
    resources :bookings, only: [:index]
  end
end
