require_relative "../config/environment"

require "rspec"
require "factory_bot"
require "faker"
require "rails/all"
require "rspec/rails"
require "database_cleaner"
require "rspec/collection_matchers"

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.example_status_persistence_file_path = ".rspec_status"

  config.before(:each, type: :request) do
    host! "test.domain"
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

RSpec::Support::ObjectFormatter.default_instance.max_formatted_output_length = nil
