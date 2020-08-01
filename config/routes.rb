Rails.application.routes.draw do
  resources :group_messages
  resources :groups
  root 'home#index'

  devise_for :users

  root controller: :groups, action: :index

  resources :group_messages
  resources :groups
  
  resources :conversations, only: [:create] do
  resources :messages, only: [:create]

    member do
      post :close
    end
  end
end