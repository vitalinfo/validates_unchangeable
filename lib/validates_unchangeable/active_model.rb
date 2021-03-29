# frozen_string_literal: true

require 'active_model'

module ActiveModel
  module Validations
    class UnchangeableValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, _value)
        if !record.public_send("#{attribute}_changed?") ||
            record.public_send("#{attribute}_was") == default_value_for(record, attribute)
          return
        end

        record.errors.add(attribute, :unchangeable)
      end

      private

      def default_value_for(record, attribute)
        return unless record.class.respond_to?(:column_defaults)

        record.class.column_defaults[attribute.to_s]
      end
    end
  end
end
