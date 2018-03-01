Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
    resources :products

    root "products#index"
  end

  resources :products, only: [:index, :show]

  root "products#index"
end
