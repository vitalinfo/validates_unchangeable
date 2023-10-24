# frozen_string_literal: true

RSpec.describe ValidatesUnchangeable do
  it_behaves_like 'unchangeable: validation', Test, :value, 'qwerty', 'ytrewq'
  it_behaves_like 'unchangeable: validation', Test, :value_bool, true, false
  it_behaves_like 'unchangeable: validation', Test, :value_bool, false, true
  it_behaves_like 'unchangeable: validation', Test, :value_bool, false, nil
  it_behaves_like 'unchangeable: validation', Test, :value_bool_false, true, false
  it_behaves_like 'unchangeable: validation', Test, :value_bool_false, false, true
  it_behaves_like 'unchangeable: validation', Test, :value_bool_false, false, nil
  it_behaves_like 'unchangeable: validation', Test, :value_bool_true, true, false
  it_behaves_like 'unchangeable: validation', Test, :value_bool_true, false, true
  it_behaves_like 'unchangeable: validation', Test, :value_bool_true, false, nil
  it_behaves_like 'unchangeable: validation', Test, :value_str, 'qwerty', 'ytrewq'
  it_behaves_like 'unchangeable: validation', TestAm, :value, 'qwerty', 'ytrewq'
end
