Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  scope '(:locale)', locale: /fr|en/ do
    root to: 'pages#home'
    get "profile", to: "pages#profile", as: 'profile'

    resources :balconies, except: [:show]
    get "balconies_private/:id", to: "balconies#show_private", as: 'private_balcony'
    get "balconies_public/:id", to: "balconies#show_public", as: 'public_balcony'

    resources :item, only: [:index, :show]
  end
end
