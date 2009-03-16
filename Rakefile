require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the conversions plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

namespace :rdoc do
  desc 'Generate documentation for conversions plugin.'
  Rake::RDocTask.new(:generate) do |rdoc|
    rdoc.rdoc_dir = 'documentation'
    rdoc.title    = 'Conversions'
    rdoc.options << '--line-numbers' << '--inline-source' << '--charset' << 'utf-8'
    rdoc.rdoc_files.include('README', 'lib/**/*.rb')
  end
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |spec|
    spec.name = "conversions"

    spec.author = "Manfred Stienstra"
    spec.email = "manfred@fngtps.com"

    spec.description = <<-EOF
      A Ruby on Rails plugin that adds conversion capabilities to numeric objects"
    EOF
    spec.summary = <<-EOF
      A Ruby on Rails plugin that adds conversion capabilities to numeric objects"
    EOF
    spec.homepage = "http://github.com/Fingertips/conversions/tree/master"
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
