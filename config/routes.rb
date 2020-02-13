Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root :to => 'addresses#new'
    end
  end

  root "items#index"
  resources :items do
    resources :comments, only: :create
    collection do
      get :edit
    end
    member do
      get :purchase
    end
  end

  resources :addresses
  resources :users, only: [:index, :show, :new, :edit, :update] do

    collection do
      get :login
      get :logout
      get :card
      get :add
      # get :new2
    end
  end
  resources :credit, only: [:index, :new, :show] do
    collection do
      post 'show', to: 'credit#show'
      post 'pay', to: 'credit#pay'
      post 'delete', to: 'credit#delete'
      # post 'purchase', to: 'credit#purchase'
    end
    member do
      post 'purchase', to: 'credit#purchase'
    end
  end
  namespace :api do
    resources :categorys, only: :index, defaults: { format: 'json' }
  end

end
