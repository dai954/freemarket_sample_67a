Rails.application.routes.draw do
  devise_for :users
  root "items#index"


  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :users, only: [:index, :show, :new] do
    collection do
      get :login
      get :logout
      get :card
      get :add
    end
  end

end
