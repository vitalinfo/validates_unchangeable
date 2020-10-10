# frozen_string_literal: true

RSpec.describe ValidatesUnchangeable do
  it_behaves_like 'unchangeable: validation', Test
  it_behaves_like 'unchangeable: validation', TestAm
end
