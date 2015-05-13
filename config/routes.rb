Rails.application.routes.draw do
  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  devise_for :users

  root 'categories#index'

  get 'avatars/random_avatar' => 'avatars#random_avatar', as: :random_avatar
end
