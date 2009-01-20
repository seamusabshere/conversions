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

namespace :gem do
  desc "Build the gem"
  task :build do
    sh 'gem build conversions.gemspec'
  end
  
  desc "Install the gem"
  task :install => :build do
    sh 'sudo gem install conversions-*.gem'
  end
end