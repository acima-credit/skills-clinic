# -*- encoding: utf-8 -*-
# stub: purdytest 2.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "purdytest".freeze
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Aaron Patterson".freeze]
  s.date = "2015-01-24"
  s.description = "Purdytest extends minitest with pretty colors.  Simply require minitest, then\nrequire purdytest, and you have colorific output on your terminal!\n\nFor colorized diff output, make sure you have `colordiff` installed.".freeze
  s.email = ["aaron@tenderlovemaking.com".freeze]
  s.extra_rdoc_files = ["CHANGELOG.rdoc".freeze, "Manifest.txt".freeze, "README.rdoc".freeze]
  s.files = ["CHANGELOG.rdoc".freeze, "Manifest.txt".freeze, "README.rdoc".freeze]
  s.homepage = "http://github.com/tenderlove/purdytest".freeze
  s.licenses = ["MIT".freeze]
  s.rdoc_options = ["--main".freeze, "README.rdoc".freeze]
  s.rubygems_version = "3.3.26".freeze
  s.summary = "Purdytest extends minitest with pretty colors".freeze

  s.installed_by_version = "3.3.26" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<minitest>.freeze, ["~> 5.5"])
    s.add_development_dependency(%q<rdoc>.freeze, ["~> 4.0"])
    s.add_development_dependency(%q<hoe>.freeze, ["~> 3.13"])
  else
    s.add_dependency(%q<minitest>.freeze, ["~> 5.5"])
    s.add_dependency(%q<rdoc>.freeze, ["~> 4.0"])
    s.add_dependency(%q<hoe>.freeze, ["~> 3.13"])
  end
end
