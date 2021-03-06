source 'http://rubygems.org'

gem 'rails', '3.2.2'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

group :development do
  gem 'sqlite3'
end

# Heroku
group :production do
  gem 'pg'
  gem 'unicorn'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.2.3"
end

# Outside of Assets because we use coffeescript
# for create/destroy views
gem 'coffee-rails', "~> 3.2.1"
gem 'uglifier'

# Template
gem 'jquery-rails'
gem 'pjax_rails'
gem 'slim'

# Mail
gem 'delayed_job_active_record'
gem 'daemons'

# Heroku Delayed Job Support (Needs to be under Delayed Job gem)
gem 'hirefire'

# Forms
gem 'remotipart'

# File Uploads
gem 'fog'
gem 'carrierwave'

# Slugs
gem 'friendly_id', '~> 4.0.0.beta8'

# Users
gem 'devise'
gem 'gravtastic'

# Twitter
gem 'twitter'
gem 'twitter-text'

# Caching
gem 'dalli'

# Post Styling
gem 'redcarpet'
gem 'nokogiri'
gem 'pygments.rb', '0.2.3'
gem 'rubypython', '0.5.1'

# Sensitive Information
gem "figaro"


# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
