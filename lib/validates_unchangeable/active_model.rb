# frozen_string_literal: true

module ActiveModel
  module Validations
    class UnchangeableValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, _value)
        return if !record.public_send("#{attribute}_changed?") || record.public_send("#{attribute}_was").nil?

        record.errors.add(attribute, :unchangeable)
      end
    end
  end
end
