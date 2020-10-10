# frozen_string_literal: true

RSpec.describe ValidatesUnchangeable do
  describe 'when create' do
    context 'without value' do
      let(:object) { Test.create }

      it { expect(object).to be_valid }
    end

    context 'with value' do
      let(:object) { Test.create(value: 'qwerty') }

      it { expect(object).to be_valid }
    end
  end

  describe 'when update' do
    context 'without value' do
      let(:object) { Test.create }

      before { object.update(value: 'qwerty') }

      it { expect(object).to be_valid }
    end

    context 'without value' do
      let(:object) { Test.create(value: 'qwerty') }

      before { object.update(value: 'ytrewq') }

      it { expect(object).to be_invalid }
    end
  end
end
