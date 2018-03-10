source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'sqlite3',                      '~> 1.3.13'
gem 'puma', '~> 3.7'
gem 'rest-client'
gem 'will_paginate',                  '~> 3.1.0'
gem 'ransack',                        git: 'https://github.com/activerecord-hackery/ransack'
gem 'simple_enum',                    '~> 2.3.0'
gem 'rack-cors'
gem 'jsonapi-rails',                  '~> 0.3.1'
gem 'json',                           '>= 2.0.0'
gem 'json-api-vanilla',               '~> 1.0.1'
gem 'request_store',                  '~> 1.3.2'
gem 'paper_trail',                    '~> 8.1'

group :development, :test do
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'pry-highlight'
  gem 'byebug', platform: :mri
  gem 'simplecov', require: false
  gem 'faker'
  gem 'rails_best_practices'
  gem 'rubocop'
  gem 'brakeman'
end

group :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
  gem 'database_cleaner'
  gem 'cpf_faker'
end
