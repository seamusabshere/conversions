# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{conversions}
  s.version = "1.4.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Manfred Stienstra", "Seamus Abshere"]
  s.date = %q{2010-05-05}
  s.description = %q{A Ruby on Rails plugin that adds conversion capabilities to numeric objects}
  s.email = %q{seamus@abshere.net}
  s.extra_rdoc_files = [
    "LICENSE",
     "README",
     "TODO"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README",
     "Rakefile",
     "TODO",
     "VERSION.yml",
     "conversions.gemspec",
     "lib/conversions.rb",
     "lib/conversions/active_record_accessors.rb",
     "lib/conversions/defaults.rb",
     "lib/conversions/unit.rb",
     "test/accessor_test.rb",
     "test/conversions_test.rb",
     "test/ext_test.rb",
     "test/test_helper.rb",
     "test/unit_test.rb"
  ]
  s.homepage = %q{http://github.com/seamusabshere/conversions}
  s.rdoc_options = ["--charset=UTF-8", "--line-numbers", "--inline-source"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{conversions}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A Ruby on Rails plugin that adds conversion capabilities to numeric objects}
  s.test_files = [
    "test/accessor_test.rb",
     "test/conversions_test.rb",
     "test/ext_test.rb",
     "test/test_helper.rb",
     "test/unit_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3.4"])
    else
      s.add_dependency(%q<activesupport>, [">= 2.3.4"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 2.3.4"])
  end
end

