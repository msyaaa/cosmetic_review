Rails.application.routes.draw do
  devise_for :users
  root 'posts#top'
  resources :posts do
    collection do
      get 'top'
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'name_search'
    end
    member do
      get 'search'
    end
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end
