
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_table_for/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_table_for'
  spec.version       = RailsTableFor::VERSION
  spec.authors       = ['Austin Roos']
  spec.email         = ['roos.austin@gmail.com']

  spec.summary       = %q{HTML tables for ActiveRecord collections, made simple}
  spec.description   = %q{Generate HTML tables for ActiveRecord collections, with many customizations available}
  spec.homepage      = 'https://acroos.github.io/rails_table_for'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'actionview', '>= 5'
  spec.add_dependency 'activerecord', '>= 5'

  spec.add_development_dependency 'bump', '~> 0.9'
  spec.add_development_dependency 'bundler', '~> 2.1', '>= 2.1.4'
  spec.add_development_dependency 'byebug', '~> 11.1', '>= 11.1.1'
  spec.add_development_dependency 'minitest', '~> 5.14'
  spec.add_development_dependency 'rake', '~> 13.0', '>= 13.0.1'
end
