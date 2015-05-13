Rails.application.routes.draw do
  resources :categories do
    resources :products do
      resources :reviews
    end
  end

  devise_for :users, controllers: {
      registrations: "users/registrations" ,
      sessions: "users/sessions"
  }

  devise_scope :user do
    get 'users/registrations/random_avatar' => 'users/registrations#random_avatar', as: :random_avatar
    get 'users/:id' => 'users/sessions#show', as: :show_user
  end

  root 'categories#index'

end
