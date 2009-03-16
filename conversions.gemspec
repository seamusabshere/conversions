# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{conversions}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Manfred Stienstra"]
  s.date = %q{2009-03-16}
  s.description = %q{A Ruby on Rails plugin that adds conversion capabilities to numeric objects"}
  s.email = %q{manfred@fngtps.com}
  s.files = ["lib/conversions", "lib/conversions/active_record_accessors.rb", "lib/conversions/defaults.rb", "lib/conversions/unit.rb", "lib/conversions.rb", "test/accessor_test.rb", "test/conversions_test.rb", "test/ext_test.rb", "test/test_helper.rb", "test/unit_test.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/Fingertips/conversions/tree/master}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{A Ruby on Rails plugin that adds conversion capabilities to numeric objects"}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
