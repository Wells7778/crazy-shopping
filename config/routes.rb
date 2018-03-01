Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  namespace :admin do
    resources :products

    root "products#index"
  end

  resources :products, only: [:index, :show] do
    member do
      post :add_to_cart
      post :subtract_from_cart
      delete :remove_from_cart
    end
  end
  resource :cart

  root "products#index"
end
