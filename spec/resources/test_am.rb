# frozen_string_literal: true

class TestAm
  include ActiveModel::Dirty
  include ActiveModel::Validations

  define_attribute_methods :value
  attr_reader :value

  validates :value, unchangeable: true

  def self.create(attributes = {})
    new(attributes).tap(&:save)
  end

  def initialize(attributes = {})
    @value = attributes[:value]
  end

  def value=(val)
    value_will_change! unless val == @value
    @value = val
  end

  def save
    changes_applied
  end
end
