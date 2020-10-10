# frozen_string_literal: true

require 'bundler/setup'
require 'active_record'
require 'sqlite3'
require 'validates_unchangeable'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

ActiveRecord::Schema.define(version: 1) do
  create_table 'tests', force: true do |t|
    t.string   'value'
  end
end

class Test < ActiveRecord::Base
  validates :value, unchangeable: true
end
