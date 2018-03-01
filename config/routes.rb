Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :products

    root "products#index"
  end

  resources :products, only: [:index, :show] do
    member do
      post :add_to_cart
    end
  end
  resource :cart

  root "products#index"
end
