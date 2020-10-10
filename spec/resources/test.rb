# frozen_string_literal: true

class Test < ActiveRecord::Base
  validates :value, unchangeable: true
end
