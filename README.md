# Codable

Rails plugin for the attribute - code

[![Gem Version](https://badge.fury.io/rb/codable.svg)](https://rubygems.org/gems/dingtalk-client)
[![Documentation](https://img.shields.io/badge/docs-YARD-blue.svg)](https://rubydoc.info/gems/codable)
[![Build Status](https://github.com/songhuangcn/codable/actions/workflows/main.yml/badge.svg)](https://github.com/songhuangcn/codable/actions/workflows/main.yml)


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

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
