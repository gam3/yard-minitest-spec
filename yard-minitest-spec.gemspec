# -*- encoding: utf-8 -*-

require 'find'

$:.unshift File.expand_path("./lib")
require 'yard-minitest-spec'

Gem::Specification.new do |s|
  s.name = "yard-minitest-spec"
  s.version = '0.1.4'

  s.summary = "YARD plugin to list MiniTest::Spec specifications inside documentation"
  s.description = %q{
    YARD plugin to list MiniTest::Spec specifications inside documentation
    for the class.methods and instance methods spec'd.

  }
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["G. Allen Morris III"]
  s.date = "2013-07-01"
  s.email = "gam3@gam3.net"
  s.homepage = "http://yardoc.org"
  s.require_paths = ["lib"]
  s.rubyforge_project = "yard-minitest-spec"
  s.rubygems_version = "1.8.11"
  s.files = Dir['ChangeLog']
  s.files = Dir['lib/*/*.rb'] + Dir['lib/*.rb']
  s.files += Dir['*.gemspec']
  s.files += Dir['examples/*'] 
  s.files += Find.find('templates').select{ |f| f if FileTest.file?(f) }

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<yard>, [">= 0"])
    else
      s.add_dependency(%q<yard>, [">= 0"])
    end
  else
    s.add_dependency(%q<yard>, [">= 0"])
  end
end
