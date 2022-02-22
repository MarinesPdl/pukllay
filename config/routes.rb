Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :fields, except: [:destroy] do
    resources :reservations, only: [:index, :show, :new, :create]
  end
  resources :reservations, only: [:edit, :update, :destroy] do
    resources :reviews, only: [:new, :create]
  end
end
