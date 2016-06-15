Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  scope '(:locale)', locale: /fr|en/ do
    devise_for :users, skip: :omniauth_callbacks
    root to: 'pages#home'
    get "profile", to: "pages#profile", as: 'profile'
    get "inspiration", to: "pages#inspiration", as: 'inspiration'

    resources :balconies, except: [:show] do
      member do
        post "add_item"
      end
    end

    get "balconies_private/:id", to: "balconies#show_private", as: 'private_balcony'
    get "balconies_public/:id", to: "balconies#show_public", as: 'public_balcony'
    get "complete", to: "balconies#complete", as: 'complete'


    resources :items, only: [:index, :show]
  end
end
