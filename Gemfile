source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'high_voltage'
gem 'heroku'
gem 'pg'
gem 'fog'
gem 'rack-cache', :require => 'rack/cache'
gem 'dragonfly', '~>0.9.8'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test, :development do
  gem 'sqlite3'
end

group :test do
  gem "rspec-rails",        :git => "git://github.com/rspec/rspec-rails.git"
  gem "rspec",              :git => "git://github.com/rspec/rspec.git"
  gem "rspec-core",         :git => "git://github.com/rspec/rspec-core.git"
  gem "rspec-expectations", :git => "git://github.com/rspec/rspec-expectations.git"
  gem "rspec-mocks",        :git => "git://github.com/rspec/rspec-mocks.git"
  gem 'rack-test'
  gem 'shoulda'
  gem 'shoulda-matchers'
end

# Rails 3.1 - Heroku
group :production do
  gem 'therubyracer-heroku', '0.8.1.pre3'
end
