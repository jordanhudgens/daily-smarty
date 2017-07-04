source 'https://rubygems.org'

ruby "2.3.1"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'
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
  gem 'factory_girl_rails', '~> 4.8'
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
  gem 'capybara', '~> 2.13'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'slim-rails', '3.1.1'
gem 'friendly_id', '~> 5.2', '>= 5.2.1'
gem 'devise', '~> 4.2', '>= 4.2.1'
gem 'devise_invitable', '~> 1.7', '>= 1.7.2'
gem 'pundit', '~> 1.1'
gem 'cocoon', '~> 1.2', '>= 1.2.10'
gem 'bootstrap', git: 'https://github.com/twbs/bootstrap-rubygem'
gem 'redcarpet', '~> 3.4'
gem 'coderay', '~> 1.1', '>= 1.1.1'
gem 'gritter', '~> 1.2'
gem "font-awesome-rails"
gem 'compass-rails'
gem 'kaminari', '~> 1.0', '>= 1.0.1'
gem 'carrierwave', '~> 1.0'
gem 'rmagick', '~> 2.16'
gem 'mini_magick', '~> 4.6'
gem 'carrierwave-aws', '~> 1.0', '>= 1.0.2'
gem 'hirb'
gem 'ckeditor', github: 'galetahub/ckeditor'
gem 'impressionist', git: 'https://github.com/jordanhudgens/impressionist'
gem 'rack-mini-profiler', require: false
gem 'memory_profiler'
gem 'flamegraph'
gem 'stackprof'
