source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'brakeman', '~> 3.5.0', require: false
  gem 'flay', '~> 2.8.1', require: false
  gem 'rails_best_practices', '~> 1.18.0', require: false
  gem 'reek', '~> 4.5.6', require: false
  gem 'rubocop', '~> 0.47.1', require: false
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'faker', '~> 1.7.3'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'rails', '~> 5.0.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'simple_form', '~> 3.4'
gem 'paperclip', '~> 4.3', '>= 4.3.6'
gem 'bcrypt', '~> 3.1.7'
gem 'httparty', '~> 0.15.5'
ruby "2.4.0"
