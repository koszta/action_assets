$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "action_assets/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "action_assets"
  s.version     = ActionAssets::VERSION
  s.authors     = ["koszta"]
  s.email       = ["peter@studentify.nl"]
  s.homepage    = "http://github.com/koszta/action_assets"
  s.summary     = "ActionAssets for assets following your structure standards."
  s.description = "ActionAssets makes easier to code your javascript and even your stylesheet"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.0"
  s.add_dependency "jquery-rails", "~> 2.0.0"
end
