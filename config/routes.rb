Rails.application.routes.draw do
  devise_for :users
  root 'posts#top'
  resources :posts do
    collection do
      get 'top'
    end
  end
end
