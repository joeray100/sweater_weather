source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'rails', '~> 5.2.6'
gem 'pg', '>= 0.18', '< 2.0'
gem "puma", ">= 4.3.8"
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'jsonapi-serializer'
gem 'figaro'
gem 'faraday'
gem 'travis'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 5.0.0'
  gem 'capybara'
  gem 'pry'
end

group :test do
  gem 'launchy'
  gem 'orderly'
  gem 'simplecov', require: false
  gem 'shoulda-matchers'
  gem 'webmock'
  gem 'vcr'
  gem 'faker'
  gem 'factory_bot_rails'
  gem 'party-parrot-formatter'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
