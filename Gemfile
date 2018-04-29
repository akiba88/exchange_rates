source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# a b c d e f g h i j k l m n o p q r s t u v w x y z

gem 'bootstrap3-datetimepicker-rails', '~> 4.14.30'

gem 'coffee-rails', '~> 4.2'

gem 'devise'

gem 'http'

gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'

gem 'momentjs-rails', '>= 2.9.0'

gem 'puma', '~> 3.7'
gem 'pundit'

gem 'rails', '~> 5.1.4'
gem 'reform'
gem 'reform-rails'

gem 'sass-rails', '~> 5.0'
gem 'sidekiq', '< 6'
gem 'sinatra', require: nil
gem 'slim'
gem 'sqlite3'

gem 'turbolinks', '~> 5'
gem 'twitter-bootstrap-rails'

gem 'uglifier', '>= 1.3.0'

gem 'whenever', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'capybara', '~> 2.13'

  gem 'factory_girl_rails'

  gem 'rspec-html-matchers'
  gem 'rspec-rails', '~> 3.7'
  gem 'rubocop'

  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'

  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
