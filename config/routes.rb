Rails.application.routes.draw do
  get 'orders/new'

  get 'orders/create'

  get 'orders/show'

  get 'orders/edit'

  get 'orders/update'

  get 'orders/destroy'

  ActiveAdmin.routes(self)
  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  scope '(:locale)', locale: /fr|en/ do
    devise_for :users, skip: :omniauth_callbacks

    root to: 'pages#home'
    get "inspiration", to: "pages#inspiration", as: 'inspiration'
    resources :users, only: [:edit, :update]
    get "profile", to: "users#show", as: 'profile'
    resources :orders, only: [:edit, :update]

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
  end
end
