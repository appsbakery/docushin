# -*- encoding: utf-8 -*-
require File.expand_path('../lib/docushin/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Todor Grudev", "Alex Ganov"]
  gem.email         = ["tagrudev@gmail.com", "aganov@gmail.com"]
  gem.description   = %q{Builds documentation based on your Ruby on Rails application routes.}
  gem.summary       = %q{Useful for generating docs on your routes.}
  gem.homepage    = "http://github.com/appsbakery/docushin"


  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "docushin"
  gem.require_paths = ["lib"]
  gem.version       = Docushin::VERSION

  gem.add_development_dependency "rails"
  gem.add_development_dependency "pry"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec", "~> 2.0"
end