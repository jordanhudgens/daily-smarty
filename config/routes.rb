Rails.application.routes.draw do
  resources :posts
  resources :topics, only: [:index, :show]
  devise_for :users
  root to: 'static#homepage'
end
