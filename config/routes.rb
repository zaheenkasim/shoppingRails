Rails.application.routes.draw do
  root 'products#index'
  resources :products
  get '/carts/all', to: 'carts#all'  # Custom route for fetching all cart data
  resources :carts                    # Generic routes for carts
end
