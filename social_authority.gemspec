lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'social_authority/version'

Gem::Specification.new do |s|
  s.add_development_dependency 'rspec', '~> 3.2'
  s.name        = 'social_authority'
  s.date        = '2015-02-19'
  s.summary     = 'Social Authority API wrapper'
  s.description = 'A Ruby interface to the Social Authority API.'
  s.authors     = ['Rustam A. Gasanov']
  s.email       = 'rustamagasanov@gmail.com'
  s.files       = Dir['lib/**/*.rb']
  s.homepage    = 'http://rubygems.org/gems/social_authority'
  s.license     = 'MIT'
  s.version     = SocialAuthority::Version
end
