# frozen_string_literal: true

require 'bundler/setup'
require 'active_record'
require 'sqlite3'
require 'validates_unchangeable'
require 'validates_unchangeable/rspec_matcher'

Dir["#{File.dirname(__FILE__)}/db/**/*.rb",
    "#{File.dirname(__FILE__)}/support/**/*.rb",
    "#{File.dirname(__FILE__)}/resources/**/*.rb"].sort.each { |f| require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
