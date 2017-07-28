Rails.application.routes.draw do
  get 'upvote/:post_slug', to: 'votes#upvote', as: 'upvote'
  get 'downvote/:post_slug', to: 'votes#downvote', as: 'downvote'
  get 'query', to: 'search#query', as: 'search_query'
  mount Ckeditor::Engine => '/ckeditor'
  resources :posts
  get 'post_links/:id', to: 'posts#post_links', as: 'post_links'
  get :post_links, controller: :posts
  resources :topics, only: [:index, :show]
  get 'topic-autocomplete', to: 'topics#autocomplete'
  devise_for :users
  get 'smarties', to: 'users#index', as: 'smarties'
  get 'popular', to: 'static#popular', as: 'popular'
  get 'follow/:following_id', to: 'users#follow_toggle', as: 'follow_toggle'
  get ':id', to: 'static#profile', as: 'profile'
  root to: 'static#homepage'
end
