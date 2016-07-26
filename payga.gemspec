$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "payga/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "payga"
  s.version     = Payga::VERSION
  s.authors     = ["oleg"]
  s.email       = ["afa@cnwork.techranch.local"]
  s.homepage    = "http://git.techranch.ru/current/payga"
  s.summary     = "Summary of Payga."
  s.description = "Description of Payga."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir['spec/**/*']

  s.add_dependency "rails", "~> 4.2.6"
  s.add_dependency "multi_json"
  s.add_dependency "oj"

  s.add_development_dependency "pg"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'fakeweb'
end
