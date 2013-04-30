source 'https://rubygems.org'

#---------------------------------------------------------------------------------------------------
# core functionality

gem "rails", :git => "git://github.com/rails/rails.git", :branch => "3-2-stable"

#---------------------------------------------------------------------------------------------------
# Server

# Bundle edge Rails instead:
gem 'sqlite3'

#---------------------------------------------------------------------------------------------------
# Reporting

# Error-Handling
gem "exception_notification"

#---------------------------------------------------------------------------------------------------
# Development Environment

group :development do
  gem "quiet_assets"
end

group :production do
  gem "mysql", "~> 2.9.1"
end

#---------------------------------------------------------------------------------------------------
# Assets
# These gems are used only for assets and not required in production environments by default.

group :assets do
  gem "coffee-rails",   "~> 3.2.1"

  # minification
  gem "uglifier",       ">=1.0.3"   # JS
  gem "yui-compressor"              # CSS
end

#---------------------------------------------------------------------------------------------------