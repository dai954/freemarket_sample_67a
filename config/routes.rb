Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items do
    member do
      get :purchase
    end
  end

  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :new, :edit, :update] do

    collection do
      get :login
      get :logout
      get :card
      get :add
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

end
