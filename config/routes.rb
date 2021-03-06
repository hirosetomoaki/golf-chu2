Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  root to: "messages#index"
  resources :users, only: [:edit, :update]
  resources :rooms do
    resources :messages, only: :create
  end

  resources :items do
    resources :buys, only: [:index, :create]
  end
end
