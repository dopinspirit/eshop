Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: {
                       sessions: 'users/sessions',
                       registrations: 'users/registrations'
                   }


  root 'navigator#index'


  get '/category_products', to: 'navigator#products_from_category', as: 'category_products'
  get '/product_details', to: 'navigator#product_details', as: 'product_details'


  post '/create_review', to: 'navigator#product_review', as: 'product_review'

  authenticated :user, lambda {|u| u.admin?} do
    scope "/admin" do
      resources :products
      resources :categories
    end
  end
end
