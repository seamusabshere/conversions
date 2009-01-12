Gem::Specification.new do |s|
  s.name     = "conversions"
  s.version  = "1.2"
  s.date     = "2009-01-12"
  s.summary  = "A Ruby on Rails plugin that adds conversion capabilities to numeric objects"
  s.homepage = "http://github.com/Fingertips/conversions/tree/master"
  s.description = "A Ruby on Rails plugin that adds conversion capabilities to numeric objects"
  s.authors  = "Fingertips"
  s.email = "manfred@fngtps.com"
  #s.files = Dir['[a-zA-Z]*'] + Dir['lib/**/*.rb'] + Dir['rails/*.rb'] + Dir['test/**/*']
  s.files = ["conversions.gemspec", "init.rb", "lib", "LICENSE", "rails", "Rakefile", "README", "test", "TODO", "lib/conversions/active_record_accessors.rb", "lib/conversions/ext.rb", "lib/conversions/unit.rb", "lib/conversions.rb", "rails/init.rb", "test/accessor_test.rb", "test/ext_test.rb", "test/test_helper.rb", "test/unit_test.rb"]
  s.test_file = "test/unit_test.rb"
end
