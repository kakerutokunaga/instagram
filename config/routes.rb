Rails.application.routes.draw do
  get 'search' => 'search#index'
  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :users, only: %i[show edit update]
  resources :posts, only: %i[new create show destroy]
end
