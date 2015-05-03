# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "metallum/version"

Gem::Specification.new do |s|
  s.name        = "metallum"
  s.version     = Metallum::VERSION
  s.authors     = ["Peco Danajlovski"]
  s.email       = ["vortexmk@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Metallum is a simple gem that fetches various data from metal-archives.com}
  s.description = %q{Metallum is a simple gem that fetches various data from metal-archives.com}

  s.rubyforge_project = "metallum"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "vcr"
  s.add_runtime_dependency(%q<mechanize>, ["~> 2.0.1"])
  s.add_runtime_dependency 'httparty'
  s.add_runtime_dependency 'activesupport'
end
