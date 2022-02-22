Rails.application.routes.draw do
  get 'reservations/index'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :fields, except: [:index, :destroy] do
    resources :reservations, only: [:new, :create]
  end
  resources :reservations, only: [:edit, :show, :index, :update, :destroy] do
    resources :reviews, only: [:new, :create]
  end
end
