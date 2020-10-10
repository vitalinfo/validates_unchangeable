# frozen_string_literal: true

require 'active_support/i18n'
require 'validates_unchangeable/version'
require 'validates_unchangeable/active_model'
I18n.load_path += Dir["#{File.dirname(__FILE__)}../config/locale/*.yml"]

module ValidatesUnchangeable
end
