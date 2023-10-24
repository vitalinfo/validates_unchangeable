# frozen_string_literal: true

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

ActiveRecord::Schema.define(version: 1) do
  create_table 'tests', force: true do |t|
    t.string   'value'
    t.boolean  'value_bool_false', default: false
    t.boolean  'value_bool_true', default: true
    t.boolean  'value_bool'
    t.string   'value_str', default: ''
  end
end
