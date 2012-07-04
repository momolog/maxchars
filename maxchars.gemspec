# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "maxchars/version"

Gem::Specification.new do |s|
  s.name        = "maxchars"
  s.version     = Maxchars::VERSION
  s.authors     = ["Alexander Presber"]
  s.email       = ["post@momolog.info"]
  s.homepage    = ""
  s.summary     = %q{input field character restriction}
  s.description = %q{jquery plugin to restrict characters that can be put into an input field or text area. Displays remaining characters in a tipsy tooltip.}

  s.rubyforge_project = "maxchars"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_dependency 'jquery-rails', '>= 1.0'
end
