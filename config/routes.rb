Rails.application.routes.draw do
  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  devise_for :users

  root 'categories#index'
  put '/categories/:category_id/products/:id' => 'products#update', as: :update_product
end
