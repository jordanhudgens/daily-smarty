Rails.application.routes.draw do
  get 'query', to: 'search#query', as: 'search_query'

  mount Ckeditor::Engine => '/ckeditor'
  resources :posts
  resources :topics, only: [:index, :show]
  devise_for :users
  get 'smarties', to: 'users#index', as: 'smarties'
  get ':id', to: 'static#profile', as: 'profile'
  root to: 'static#homepage'
end
