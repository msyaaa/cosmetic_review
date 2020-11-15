Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
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
