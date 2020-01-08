require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.role == 'site_admin' } do
    mount Sidekiq::Web => '/sidekiq'
  end

  namespace :api, path: '/', constraints: { subdomain: 'api' } do
    resources :posts, only: [:index, :create]
    get 'search', to: 'posts#search'
  end

  post 'upvote/:post_slug', to: 'votes#upvote', as: 'upvote'
  post 'downvote/:post_slug', to: 'votes#downvote', as: 'downvote'
  get 'query', to: 'search#query', as: 'search_query'
  mount Ckeditor::Engine => '/ckeditor'
  resources :posts
  get 'post_links/:id', to: 'posts#post_links', as: 'post_links'
  get :post_links, controller: :posts
  get 'topic_follow_toggle/:id', to: 'topics#topic_follow_toggle', as: 'topic_follow_toggle'
  resources :topics, only: [:index, :show]
  get 'topic-autocomplete', to: 'topics#autocomplete'
  devise_for :users
  get 'social-connections/disconnect_facebook', to: 'users/social_disconnects#disconnect_facebook', as: :disconnect_facebook
  get 'social-connections/disconnect_twitter', to: 'users/social_disconnects#disconnect_twitter', as: :disconnect_twitter
  get 'smarties', to: 'users#index', as: 'smarties'
  get 'username_validator/:username', to: 'users#username_validator'
  get 'popular', to: 'static#popular', as: 'popular'
  get 'corporate/privacy-policy', to: 'static#privacy_policy', as: 'privacy_policy'
  get 'corporate/terms-conditions', to: 'static#terms_conditions', as: 'terms_conditions'
  get 'corporate/branding', to: 'static#branding', as: 'branding'
  get 'follow/:following_id', to: 'users#follow_toggle', as: 'follow_toggle'
  get ':id', to: 'static#profile', as: 'profile'

  root to: 'static#homepage'

  if Rails.env.production?
    get '404', to: 'errors#not_found'
    get '422', to: 'errors#internal_server_error'
    get '500', to: 'errors#internal_server_error'
  end
end
