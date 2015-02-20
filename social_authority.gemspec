Gem::Specification.new do |s|
  s.add_dependency 'httparty', '>= 0.11.0', '< 0.12.0'
  s.add_development_dependency 'rspec', '~> 3.2'
  s.name        = 'social_authority'
  s.version     = '0.0.0'
  s.date        = '2015-02-19'
  s.summary     = 'Social Authority API Fetcher'
  s.description = 'A Ruby interface to the Social Authority API.'
  s.authors     = ['Rustam A. Gasanov']
  s.email       = 'rustamagasanov@gmail.com'
  s.files       = Dir['lib/**/*.rb']
  s.homepage    = 'http://rubygems.org/gems/social_authority'
  s.license     = 'MIT'
end
