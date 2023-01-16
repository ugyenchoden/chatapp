# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.4'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
gem 'pgcrypto'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"
gem 'action_policy-graphql'
gem 'apollo_upload_server', '2.0.5'
gem 'devise'
gem 'devise_invitable'
gem 'devise-jwt'
gem 'dotenv-rails'
gem 'graphql-batch'
gem 'graphql-query-resolver'
gem 'recursive-open-struct'
gem 'rswag'
gem 'rswag-api'
gem 'rswag-ui'
gem 'scenic'
gem 'search_object'
gem 'search_object_graphql'

group :development, :test do
  gem 'awesome_print'
  gem 'benchmark-ips'
  gem 'bullet'
  gem 'bundler-audit'
  gem 'bundler-leak'
  gem 'database_cleaner-active_record'
  gem 'email_spec'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'niceql' # Don't use in production!
  gem 'parallel_tests'
  gem 'pghero'
  gem 'pry'
  gem 'rails_best_practices'
  gem 'rdoc', '6.3.3'
  gem 'rspec-benchmark'
  gem 'rspec-rails', '~> 5.0.0'
  gem 'rswag-specs'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rake'
  gem 'rubocop-rspec'
  gem 'rubycritic', require: false
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'solargraph'
  gem 'test-prof'
  gem 'webmock'
  gem 'webrick'
end

group :development do
  gem 'brakeman'
  gem 'graphiql-rails'
  gem 'letter_opener'
  gem 'listen', '~> 3.3'
  gem 'sprockets', '~> 3'
end

gem 'graphql', '~> 1.13.12'
