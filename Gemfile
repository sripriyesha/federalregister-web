source 'https://rubygems.org'

# basic rails stack
gem 'rails', '6.0.3.2'
gem 'rake'
gem 'rack'
gem 'mysql2', '0.5.2'
gem 'passenger', '~> 6.0' # production app server
gem 'bootsnap', require: false
gem 'sassc', '2.1.0'

# mimemagic 0.3.5 version fix
gem 'mimemagic', github: 'mimemagicrb/mimemagic', ref: '01f92d86d15d85cfd0f20dabd025dcbd36a8a60f'

# AR like interface to static data hash based classes
gem 'active_hash'

#ensure connections to missing db don't cause precompilation to fail
gem "activerecord-nulldb-adapter"

# remove boilerplate code for abstracting small, focused classes
gem 'attr_extras', '~> 3.2.0'

# bootstrap sass integration
gem 'bootstrap-sass'

# http caching - reg.gov api caching
gem 'cachebar',
  git: "https://github.com/criticaljuncture/cachebar.git"

# html calendar generation
gem 'calendar_helper',
  git: "https://github.com/criticaljuncture/calendar_helper.git",
  branch: 'master'

# file uploads (comment attachments)
gem "carrierwave", "0.11.2"

# parse more date formats when needed
gem 'chronic', '~> 0.10.2'

# command line integration
gem "terrapin"

# coffeescript integration
gem 'coffee-rails', '~> 5.0'

# app wide settings
gem 'config'

# model decorators
gem "draper"

# http client - FR Profile
gem 'faraday'

# FR API ruby library
gem 'federal_register', '0.7.6'
#gem 'federal_register', :path => '../federal_register'
#gem 'federal_register', :git => "https://github.com/usnationalarchives/federal_register.git",
#                        :ref => "master"

# aws integration
gem 'fog-aws'

# forms
gem 'formtastic'

# geocoding and distance calculation API
gem 'geokit', '1.4.1', require: 'geokit'

# url hyperlinker
gem 'htmlentities'

# error reporting
gem 'honeybadger'

# http requests
gem "httparty"

# adds indefinite article methods to String and Symbol
gem 'indefinite_article'

# JSON web tokens (share notifications across services)
gem 'jwt'

# jquery integration
gem 'jquery-rails'

# varnish cache client
gem 'klarlack', '0.0.7',
  git: 'https://github.com/criticaljuncture/klarlack.git',
  ref: 'f4c9706cd542046e7e37a4872b3a272b57cbb31b'

# preview emails in the broswer
gem 'mail_view',
  git: 'https://github.com/37signals/mail_view.git'

# enhanced method memoization
gem 'memoist'

# xslt parsing
gem 'nokogiri'

# Single sign on
gem 'omniauth_openid_connect',
  git: 'https://github.com/m0n9oose/omniauth_openid_connect',
  branch: 'master'

# pick item(s) from collection by it's weight/probability
gem "pickup", "0.0.8"

# inline css for mailer templates
gem 'premailer-rails'

# add methods to the ruby Process command via C-extensions
# (tracking memory usage)
gem 'proc-wait3'

# CORS support
gem 'rack-cors', require: 'rack/cors'

# automatically create links urls, etc. in text
gem 'rails_autolink'

# google recaptcha integration
gem 'recaptcha', '0.4.0', require: 'recaptcha/rails'

# redis integration - background jobs, etc.
gem 'redis', '~> 3.3.5'

# per-request global storage for Rack.
gem 'request_store'

# background jobs, resque web interface - rails engine
gem 'resque', '~> 1.27.0'
gem 'resque-retry'

# sass integration
gem 'sass-rails', '~> 5.1'
gem "sass"

# add safer handling for target="_blank"
gem 'safe_target_blank'

# email provider integration
gem 'sendgrid'

# background jobs
gem 'sidekiq', '~> 5.2.9'

# js minification
gem 'uglifier'

# js helper functions
gem 'underscore-rails', '~> 1.6.0'

# search pagination
gem 'will_paginate'
gem 'will_paginate-bootstrap', '~> 1.0.1'

gem 'sitemap_generator'

gem 'activerecord-userstamp', git: 'https://github.com/criticaljuncture/userstamp', branch: 'rails_six'

group :development do
  gem 'web-console', '~> 2.0'
end

group :development, :test do
  gem 'capybara'
  #gem 'capybara-webkit'
  #gem 'capybara-screenshot'

  gem 'codeclimate-test-reporter', :require => nil
  gem 'database_cleaner'
  gem 'email_spec'

  gem "factory_girl_rails", "~> 4.0"
  gem 'webmock'

  #auto test runner
  gem 'guard'
  gem 'guard-rspec', require: false

  gem 'launchy'

  gem 'pry'
  gem 'pry-remote'

  gem 'rspec-rails', '~> 3.2'
  gem 'rspec-html-matchers'#, '~> 0.5.0'

  gem 'rubocop', '~> 0.57.0'

  gem 'timecop'

  gem "vcr", "~> 2.6.0"
  gem 'watchr', '0.7'
end
