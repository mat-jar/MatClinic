
# spec/rails_helper.rb
# This file is copied to spec/ when you run 'rails generate rspec:install'

require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
require 'capybara/rspec'
require 'selenium/webdriver'

# Use Puma for Capybara server
Capybara.server = :puma, { Silent: true }

# -------------------------------
# Support files
# -------------------------------
Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }

# -------------------------------
# ActiveRecord migration check
# -------------------------------
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

# -------------------------------
# RSpec configuration
# -------------------------------
RSpec.configure do |config|
  # Include FactoryBot methods (create/build)
  config.include FactoryBot::Syntax::Methods

  # Fixtures path
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # Use transactional fixtures for test isolation
  config.use_transactional_fixtures = true

  # Infer test type from file location
  config.infer_spec_type_from_file_location!

  # Filter Rails gems from backtrace
  config.filter_rails_from_backtrace!

  # -------------------------------
  # System test setup (Capybara + Selenium + Headless Firefox)
  # -------------------------------
  config.before(:each, type: :system) do
   driven_by :selenium_headless
  end
end

# Set Capybara javascript driver globally
Capybara.javascript_driver = :selenium_firefox_headless
