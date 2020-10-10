# frozen_string_literal: true

require 'spec_helper'

if defined?(ActiveModel)
  RSpec.describe 'RSpec matcher' do
    subject { Test }

    it 'should ensure that attributes are validated' do
      should validate_unchangeable_of(:value)
    end
  end
end
