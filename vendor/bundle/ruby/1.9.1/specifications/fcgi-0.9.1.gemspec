# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "fcgi"
  s.version = "0.9.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["mva"]
  s.date = "2013-02-20"
  s.description = "FastCGI is a language independent, scalable, open extension to CGI that provides high performance without the limitations of server specific APIs. This version aims to be compatible with both 1.8.x and 1.9.x versions of Ruby, and also will be ported to 2.0.x."
  s.email = "mva@mva.name"
  s.extensions = ["ext/fcgi/extconf.rb"]
  s.extra_rdoc_files = ["LICENSE", "README.rdoc", "README.signals"]
  s.files = ["LICENSE", "README.rdoc", "README.signals", "ext/fcgi/extconf.rb"]
  s.homepage = "http://github.com/alphallc/ruby-fcgi-ng"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.11"
  s.summary = "FastCGI library for Ruby."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
