source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record
gem 'sqlite3', group: :development

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'multi_json', '1.7.8'
gem 'devise', '3.0.2'
gem 'rails_admin'
gem 'carrierwave'
gem 'rmagick'
gem "asset_sync"
gem "excon", "~> 0.25.3"
gem "acts-as-taggable-on", "~> 2.4.1"
gem 'friendly_id', '~> 5.0.0.alpha1', github: 'FriendlyId/friendly_id', branch: 'master'
gem "public_activity", "~> 1.4.0", github: 'pokonski/public_activity', branch: 'master'

group :production do
  gem 'rails_12factor'
  gem 'pg'
  gem 'unicorn'
end

group :development do
  gem 'letter_opener'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  # Use debugger
  # gem 'debugger', group: [:development, :test]
end

group :test do
  gem 'capybara'
end
