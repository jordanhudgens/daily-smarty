source 'https://rubygems.org'

ruby "~> 2.5.0"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.5'
gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5', '>= 3.5.2'
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
  gem 'capybara', '~> 2.13'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'foreman'
  gem 'rubocop', require: false
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'slim-rails', '3.1.1'
gem 'friendly_id', '~> 5.2', '>= 5.2.1'
gem 'devise', '~> 4.2', '>= 4.2.1'
gem 'devise_invitable', '~> 1.7', '>= 1.7.2'
gem 'pundit', '~> 1.1'
gem 'cocoon', '~> 1.2', '>= 1.2.10'
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'popper_js'
gem 'redcarpet', '~> 3.4'
gem 'coderay', '~> 1.1', '>= 1.1.1'
gem 'gritter', '~> 1.2'
gem "font-awesome-rails"
gem 'compass-rails', '~> 3.0', '>= 3.0.2'
gem 'kaminari', '~> 1.0', '>= 1.0.1'
gem 'carrierwave', '~> 1.0'
gem 'rmagick', '~> 2.16'
gem 'mini_magick', '~> 4.9'
gem 'carrierwave-aws', '~> 1.0', '>= 1.0.2'
gem 'hirb'
gem 'ckeditor', github: 'galetahub/ckeditor'
gem 'impressionist', git: 'https://github.com/jordanhudgens/impressionist'
gem 'rack-mini-profiler', require: false
gem 'memory_profiler'
gem 'flamegraph'
gem 'stackprof'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'honeybadger', '~> 3.1'
gem 'link_thumbnailer'
gem "validate_url"
gem 'render_async'
gem "paranoia", "~> 2.2"
gem "koala"
gem 'omniauth-facebook'
gem 'sidekiq'
gem 'twitter', '~> 6.1'
gem 'omniauth-twitter', '~> 1.4'
gem 'inline_svg'
gem 'active_model_serializers', '~> 0.10.7'
gem 'rack-cors', :require => 'rack/cors'
gem 'sanitize'
gem "sprockets", ">= 3.7.2"
gem "nokogiri", ">= 1.8.5"
