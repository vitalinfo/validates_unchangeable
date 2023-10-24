# frozen_string_literal: true

RSpec.shared_examples_for 'unchangeable: validation' do |klass, attribute, value, new_value| # rubocop:disable Metrics/BlockLength
  describe 'when create' do
    context 'without value' do
      let(:object) { klass.new.tap(&:save) }

      it { expect(object).to be_valid }
    end

    context 'with value' do
      let(:object) { klass.create(attribute => value) }

      it { expect(object).to be_valid }
    end
  end

  describe 'when update' do
    context 'without value' do
      let(:object) { klass.new }

      before do
        object.public_send("#{attribute}=", value)
        object.save
      end

      it { expect(object).to be_valid }
    end

    context 'with value' do
      let(:object) { klass.create(attribute => value) }

      before do
        object.public_send("#{attribute}=", new_value)
      end

      it { expect(object).to be_invalid }
    end
  end
end
