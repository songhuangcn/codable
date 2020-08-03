$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'codable/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'codable'
  spec.version     = Codable::VERSION
  spec.authors     = ['Song Huang']
  spec.email       = ['songhuangcn@qq.com']
  spec.homepage    = 'https://github.com/songhuangcn/codable'
  spec.summary     = 'Rails plugin for the attribute - code'
  spec.description = 'Rails plugin for the attribute - code'
  spec.license     = 'MIT'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.required_ruby_version = '>= 2.5'

  spec.add_dependency 'rails', '~> 6.0'
end
