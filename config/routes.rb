Rails.application.routes.draw do
  devise_for :users

  root 'navigator#index'

  get '/category_products', to: 'navigator#products_from_category', as: 'category_products'

  resources :products
  resources :categories

end
