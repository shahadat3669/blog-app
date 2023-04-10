Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :likes, only: [:new, :create]
    end
  end
  resources :posts do
    resources :comments, only: [:new, :create]
  end
end
