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
  Jeweler::Tasks.new do |gem|
    gem.name = "conversions"
    gem.summary = %Q{A Ruby on Rails plugin that adds conversion capabilities to numeric objects}
    gem.description = %Q{A Ruby on Rails plugin that adds conversion capabilities to numeric objects}
    gem.email = "seamus@abshere.net"
    gem.homepage = "http://github.com/seamusabshere/conversions"
    gem.authors = ["Manfred Stienstra", "Seamus Abshere"]
    gem.require_path = "lib"
    gem.rdoc_options << '--line-numbers' << '--inline-source'
    gem.rubyforge_project = "conversions"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
  Jeweler::RubyforgeTasks.new do |rubyforge|
    rubyforge.doc_task = "rdoc"
  end
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end