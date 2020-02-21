Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  # ログイン・新規登録で必要なルーティングが生成される
  devise_for :users 

  root "items#index"
  namespace :items do
    resources :searches, only: :index
  end
  resources :items do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
    member do
      get :purchase
    end
  end

  resources :addresses
  resources :users, only: [:index, :show, :new, :edit, :update] do

    collection do
      get :like
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
  namespace :api do
    resources :categorys, only: :index, defaults: { format: 'json' }
  end

end
