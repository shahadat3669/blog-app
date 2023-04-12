Rails.application.routes.draw do
  devise_for :users
  
  root to: "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :likes, only: [:new, :create]
    end
  end
  resources :posts do
    resources :comments, only: [:new, :create]
  end
end
