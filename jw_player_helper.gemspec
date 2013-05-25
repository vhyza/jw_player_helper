# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "jw_player_helper/version"

Gem::Specification.new do |s|
  s.name        = "jw_player_helper"
  s.version     = JWPlayerHelper::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Vojtech Hyza"]
  s.email       = ["vhyza@vhyza.eu"]
  s.homepage    = "http://github.com/vhyza/jw_player_helper"
  s.summary     = %q{JWPlayer helper}
  s.description = %q{Simple Rails JWPlayer helper}

  s.rubyforge_project = "jw_player_helper"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.rdoc_options      = [ "--charset=UTF-8" ]

  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency "rake"
  s.add_dependency "bundler",     ">= 1.0.0"
  s.add_dependency "yajl-ruby",   "> 0.8.0"
  s.add_dependency "activesupport"
  s.add_dependency "i18n"


  s.add_development_dependency "turn"
  s.add_development_dependency "mocha"
  s.add_development_dependency "shoulda"
  s.add_development_dependency "rails"

end
