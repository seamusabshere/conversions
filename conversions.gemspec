Gem::Specification.new do |spec|
  spec.name = "conversions"
  spec.version = "1.3.0"
  
  spec.author = "Manfred Stienstra"
  spec.email = "manfred@fngtps.com"
  
  spec.description = <<-EOF
    A Ruby on Rails plugin that adds conversion capabilities to numeric objects"
  EOF
  spec.summary = <<-EOF
    A Ruby on Rails plugin that adds conversion capabilities to numeric objects"
  EOF
  spec.homepage = "http://github.com/Fingertips/conversions/tree/master"
  
  spec.files = ["init.rb", "lib", "LICENSE", "rails", "Rakefile", "README", "test", "TODO", "lib/conversions/active_record_accessors.rb", "lib/conversions/defaults.rb", "lib/conversions/unit.rb", "lib/conversions.rb", "rails/init.rb", "test/accessor_test.rb", "test/ext_test.rb", "test/test_helper.rb", "test/unit_test.rb", "test/conversions_test.rb"]
  spec.test_files = ["test/unit_test.rb", "test/accessor_test.rb", "test/ext_test.rb", "test/test_helper.rb", "test/conversions_test.rb"]
  
  spec.has_rdoc = true
  spec.extra_rdoc_files = ['README', 'LICENSE']
  spec.rdoc_options << "--charset=utf-8"
end
