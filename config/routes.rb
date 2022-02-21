Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :fields, except: [:index, :destroy] do
    resources :reservations, only: [:index, :new, :create]
  end
  resources :reservations, only: [:edit, :update, :destroy] do
    resources :reviews, only: [:new, :create]
  end
end
