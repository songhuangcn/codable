# Codable
Rails plugin for the attribute - code

![rails-5-x](https://github.com/hdgcs/codable/workflows/rails-5-x/badge.svg)

## Installation
Include the gem to your Gemfile:
```ruby
gem 'codable', '~> 6.x' # For Rails 6.x
gem 'codable', '~> 5.x' # For Rails 5.x
```

## Usage
Include Codable for your model:
```ruby
class Platform < ApplicationRecord
  include Codable
  # self.codable_key = :other # You needn't do this until the attribute is not `code`
end
```

Test it in Rails Console:
```ruby
Platform.create!([
  { id: 1, code: 'linux' },
  { id: 2, code: 'macos' },
])
Platform[:linux]        # => #<Platform: 1>
Platform[:linux].id     # => 1, hit cache this time
Platform[:linux].linux? # => true, hit cache this time
Platform[:linux].macos? # => false, hit cache this time
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
