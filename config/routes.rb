Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :yacht, only: [:index]
end
