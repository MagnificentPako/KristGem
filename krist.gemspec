Gem::Specification.new do |s|
  s.name        = 'krist'
  s.version     = '0.0.4'
  s.date        = '2016-06-03'
  s.summary     = "A Ruby API for the cryptocurrency Krist"
  s.description = "IDK what I should write here"
  s.authors     = ["H4X0RZ"]
  s.email       = 'iililiiillliliililillij@gmail.com'
  s.files       = ["lib/krist.rb","lib/krist/kristclient.rb","lib/krist/kwallet.rb", "lib/krist/reinboo.rb","lib/krist/kristapi.rb"]
  s.homepage    =
    'http://rubygems.org/gems/krist'
  s.license       = 'MIT'
  s.add_runtime_dependency "httparty", "~> 0.13", ">= 0.13.7"
end
