# frozen_string_literal: true

RSpec.describe ValidatesUnchangeable do
  it_behaves_like 'unchangeable: validation', Test, :value, 'qwerty', 'ytrewq'
  it_behaves_like 'unchangeable: validation', Test, :value_bool, true, false
  it_behaves_like 'unchangeable: validation', Test, :value_bool, false, nil
  it_behaves_like 'unchangeable: validation', Test, :value_str, 'qwerty', 'ytrewq'
  it_behaves_like 'unchangeable: validation', TestAm, :value, 'qwerty', 'ytrewq'
end
