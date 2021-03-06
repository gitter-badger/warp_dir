# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'warp_dir/version'

Gem::Specification.new do |gem|
  gem.name          = 'warp_dir'
  gem.license       = 'mit'
  gem.authors       = ['Konstantin Gredeskoul']
  gem.email         = ['kig@reinvent.one']
  gem.version       = WarpDir::VERSION

  gem.summary       = %q{Warp Directory: this is drop in replacement of the 'wd' tool available on ZSH. Written in ruby, it is available for any shell.}
  gem.description   = %q{ZSH has a very nifty tool called 'wd' for Warp Directory (https://github.com/mfaerevaag/wd). Unfortunately it only works with ZSH.}
  gem.homepage      = "https://github.com/kigster/warp_dir"


  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ventable"
  gem.require_paths = ["lib"]

  gem.add_dependency('methadone', '~> 1.9.2')

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rdoc'
  gem.add_development_dependency 'aruba'
  gem.add_development_dependency('rake')
  gem.add_development_dependency 'rspec', '~> 3'
  gem.add_development_dependency 'rspec-mocks'
  gem.add_development_dependency 'guard-rspec'
end
