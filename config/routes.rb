Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :products
  root 'products#index'

  resources :categories do
    resources :product_groups 
  end

  post '/cart' => 'application#add_to_cart'
  get '/cart' => 'cart#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
