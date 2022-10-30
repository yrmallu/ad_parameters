# frozen_string_literal: true

source 'https://rubygems.org'

ruby File.read('.ruby-version')

gem 'google-protobuf'
gem 'nokogiri'

group :development, :test do
  gem 'bundler-audit'
  gem 'license_finder'
  gem 'overcommit'
  gem 'rubocop-rspec'
  gem 'rubocop-shopify'
end

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
end
