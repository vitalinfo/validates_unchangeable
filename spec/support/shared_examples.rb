# frozen_string_literal: true

RSpec.shared_examples_for 'unchangeable: validation' do |klass| # rubocop:disable Metrics/BlockLength
  describe 'when create' do
    context 'without value' do
      let(:object) { klass.new.tap(&:save) }

      it { expect(object).to be_valid }
    end

    context 'with value' do
      let(:object) { klass.create(value: 'qwerty') }

      it { expect(object).to be_valid }
    end
  end

  describe 'when update' do
    context 'without value' do
      let(:object) { klass.create }

      before do
        object.value = 'qwerty'
      end

      it { expect(object).to be_valid }
    end

    context 'without value' do
      let(:object) { klass.create(value: 'qwerty') }

      before do
        object.value = 'ytrewq'
      end

      it { expect(object).to be_invalid }
    end
  end
end
