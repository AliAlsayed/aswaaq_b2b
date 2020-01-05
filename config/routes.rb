Rails.application.routes.draw do
  devise_for :users
  resources :products
  resources :product_groups
  resources :categories
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
