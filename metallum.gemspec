# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "metallum/version"

Gem::Specification.new do |s|
  s.name        = "metallum"
  s.version     = Metallum::VERSION
  s.authors     = ["Peco Danajlovski"]
  s.email       = ["vortexmk@gmail.com"]
  s.homepage    = "http://mkmetal.mk"
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "metallum"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
