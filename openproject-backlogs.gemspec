# encoding: UTF-8
$:.push File.expand_path("../lib", __FILE__)

require 'open_project/backlogs/version'
# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "openproject-backlogs"
  s.version     = OpenProject::Backlogs::VERSION
  s.authors     = "Alex Groleau"
  s.email       = "alex@teampalmtree.com"
  s.homepage    = "https://github.com/TeamPalmTree/openproject-backlogs"  # TODO check this URL
  s.summary     = 'OpenProject Backlogs'
  s.description = ''
  s.license     = ''

  s.files = Dir["{app,config,db,lib}/**/*"] + %w(CHANGELOG.md README.md)

  s.add_dependency "rails", "~> 3.2.14"
end
