Rails.application.routes.draw do
  devise_for :users
  root 'posts#top'
  resources :posts do
    collection do
      get 'top'
    end
  end
  resources :users, only: [:show]
end
