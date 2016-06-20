Rails.application.routes.draw do

  get 'payments/new'

  get 'orders/show'

  ActiveAdmin.routes(self)
  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  scope '(:locale)', locale: /fr|en/ do
    devise_for :users, skip: :omniauth_callbacks

    root to: 'pages#home'
    get "inspiration", to: "pages#inspiration", as: 'inspiration'
    resources :users, only: [:edit, :update]
    get "profile", to: "users#show", as: 'profile'

    get "cart", to: "carts#show", as: 'cart'

    resources :carts, only: [:destroy] do
      collection do
       post "add_item"
       post "remove_item"
      end
    end
    post "add_item", to: "carts#add_item", as: 'add_item_cart'
    post "remove_item", to: "carts#remove_item", as: 'remove_item_cart'

    resources :balconies, except: [:show] do
      resources :reviews, only: :create
      member do
        post "add_item"
        post "remove_item"
      end
    end

    get "balconies_private/:id", to: "balconies#show_private", as: 'private_balcony'
    get "balconies_public/:id", to: "balconies#show_public", as: 'public_balcony'
    get "complete", to: "balconies#complete", as: 'complete'

    resources :items, only: [:index, :show, :destroy] do
      member do
        post "add_plant"
        post "remove_plant"
        post "duplicate"
      end
    end

    resources :orders, only: [:show, :create] do
      resources :payments, only: [:new, :create]
    end
  end
end
