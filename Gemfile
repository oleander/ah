# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.1.0"
gem "bootsnap", require: false
gem "pg"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem "database_cleaner"
  gem "factory_bot"
  gem "factory_bot_rails"
  gem "faker"
  gem "pry"
  gem "rspec"
  gem "rspec-collection_matchers"
  gem "rspec-rails"
end

group :development do
  gem "rubocop"
  gem "rubocop-rspec"
end
