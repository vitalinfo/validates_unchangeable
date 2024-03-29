# frozen_string_literal: true

class Test < ActiveRecord::Base
  validates :value, unchangeable: true
  validates :value_bool, unchangeable: true
  validates :value_bool_false, unchangeable: true
  validates :value_bool_true, unchangeable: true
  validates :value_str, unchangeable: true
end
