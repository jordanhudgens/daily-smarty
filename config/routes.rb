require 'sidekiq/web'

Rails.application.routes.draw do
  authenticate :user, lambda { |u| u.role == 'site_admin' } do
    mount Sidekiq::Web => '/sidekiq'
  end

  post 'upvote/:post_slug', to: 'votes#upvote', as: 'upvote'
  post 'downvote/:post_slug', to: 'votes#downvote', as: 'downvote'
  get 'query', to: 'search#query', as: 'search_query'
  mount Ckeditor::Engine => '/ckeditor'
  resources :posts
  get 'post_links/:id', to: 'posts#post_links', as: 'post_links'
  get :post_links, controller: :posts
  resources :topics, only: [:index, :show]
  get 'topic-autocomplete', to: 'topics#autocomplete'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  get 'social-connections/disconnect_facebook', to: 'users/social_disconnects#disconnect_facebook', as: :disconnect_facebook
  get 'smarties', to: 'users#index', as: 'smarties'
  get 'popular', to: 'static#popular', as: 'popular'
  get 'corporate/privacy-policy', to: 'static#privacy_policy', as: 'privacy_policy'
  get 'corporate/terms-conditions', to: 'static#terms_conditions', as: 'terms_conditions'
  get 'follow/:following_id', to: 'users#follow_toggle', as: 'follow_toggle'
  get ':id', to: 'static#profile', as: 'profile'

  root to: 'static#homepage'
end
