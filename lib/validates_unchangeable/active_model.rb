# frozen_string_literal: true

module ActiveModel
  module Validations
    class UnchangeableValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, _value)
        if record.public_send("#{attribute}_changed?") && record.public_send("#{attribute}_was").present?
          record.errors.add(attribute, :unchangeable)
        end
      end
    end
  end
end
