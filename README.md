# Validates Unchangeable

This gem adds the capability of validating unchangeable attributes to ActiveRecord and ActiveModel.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'validates_unchangeable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install validates_unchangeable

## Usage

### With ActiveRecord

```ruby
class User < ActiveRecord::Base
  validates :email, unchangeable: true
end
```

### With ActiveModel
```ruby
class User
  include ActiveModel::Dirty
  include ActiveModel::Validations

  define_attribute_methods :email
  attr_reader :email

  validates :email, unchangeable: true

  def self.create(attributes = {})
    new(attributes).tap(&:save)
  end

  def initialize(attributes = {})
    @email = attributes[:email]
  end

  def value=(val)
    value_will_change! unless val == @email
    @email = val
  end

  def save
    changes_applied
  end
end
````

### With RSpec
Require the matcher in `spec_helper.rb` or `rails_helper.rb`:

```ruby
require 'validates_unchangeable/rspec_matcher'
```

In your spec:

```ruby
describe User
  it { is_expected.to validate_unchangeable_of(:email) }
end
```

### I18n
The default error message `cannot be changed`.
You can pass the `message: "my custom error"` option to your validation to define your own, custom message.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/validates_unchangeable. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
