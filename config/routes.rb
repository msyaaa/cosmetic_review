Rails.application.routes.draw do
  devise_for :users
  root 'posts#top'
  resources :posts do
    collection do
      get 'top'
    end
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end
