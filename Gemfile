source 'http://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.5'

gem 'heroku'
gem "pg"
gem 'fog'
gem 'rack-cache', :require => 'rack/cache'
gem 'dragonfly', '~>0.9.8'
gem "airbrake"
gem 'unicorn'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'activeadmin'
gem 'cancan'
gem 'wymeditor-rails', :git => "git://github.com/iffyuva/wymeditor-rails.git"

group :production do
  gem 'newrelic_rpm'
end

group :test, :development do
  gem "rspec-rails"
  gem 'pry-rails'
end

group :test do
  gem "factory_girl_rails"
  gem "rspec-rails"
  gem 'rack-test'
  gem 'shoulda-matchers'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'capybara'
  gem "capybara-webkit"
  gem 'email_spec'
  gem "headless"
  gem "ci_reporter"
  gem 'simplecov', :platform => :mri_19
  gem 'simplecov-rcov', :require => false
end
