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
end
