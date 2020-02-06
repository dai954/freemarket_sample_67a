Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items do
    collection do
      get :purchase
    end
  end

  resources :buyer, only: [:index, :show] do
    collection do
      get 'done', to: 'buyer#done'
    end
  end



  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :users, only: [:index, :show, :new, :edit, :update] do

    collection do
      get :login
      get :logout
      get :card
      get :add
    end
  end

end
