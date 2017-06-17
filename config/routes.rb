Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :posts
  resources :topics, only: [:index, :show]
  devise_for :users
  get ':id', to: 'static#profile', as: 'profile'
  root to: 'static#homepage'
end
