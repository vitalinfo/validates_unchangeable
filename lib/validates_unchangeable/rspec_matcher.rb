# frozen_string_literal: true

RSpec::Matchers.define :validate_unchangeable_of do |attribute|
  match do
    actual = subject.is_a?(Class) ? subject.new : subject
    actual.public_send(:"#{attribute}=", 'qwerty')
    actual.save(validate: false)
    actual.public_send(:"#{attribute}=", 'ytrewq')
    expect(actual).to be_invalid
    @expected_message ||= I18n.t('errors.messages.unchangeable')
    expect(actual.errors.messages[attribute.to_sym]).to include(@expected_message)
  end
  chain :with_message do |message|
    @expected_message = message
  end
end
