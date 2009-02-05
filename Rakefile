GEM_NAME = 'lokii'

require File.join(File.expand_path(File.dirname(__FILE__)), 'config', 'boot.rb')

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Test the lokii gem'
Rake::TestTask.new(:test) do |t|
  t.libs << 'config'
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = File.join('test', '**', '*_test.rb')
  t.verbose = true
end
 
desc 'Generate documentation for lokii'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'Transceivers'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include(File.join('lib', '**', '*.rb'))
end

Dir[File.join('tasks', '**', '*.rake')].each { |rake| load rake }

# By default, we test. We love tests.
task :default => [:test]

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name        = "#{GEM_NAME}"
    s.summary     = "Ruby Short Message Service Framework"
    s.email       = "jeff@socialrange.org"
    s.homepage    = "http://socialrange.org/"
    s.description = "Lokii is a Ruby SMS framework for ultimate awesomeness and with configurable servers and handlers."
    s.authors     = ["Jeff Rafter"]
    s.files       = FileList["[A-Z]*.*", "{bin,lib,script,test}/**/*"] + ["config/boot.rb", "config/init.rb", "config/process.rb", "config/settings.example.yml", "config/database.example.yml", "config/messages.example.yml"]
    s.executables = "lokii"
  end
rescue LoadError
  puts 'Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com'
end

def windows?
  false
end
 
def remove(task) 
  Rake.application.instance_variable_get("@tasks").delete(task)
end
  
remove 'gem'
remove 'gem:build'
remove 'gem:install'

namespace :jeweler do 
  desc 'Uninstall the current gem'
  task :uninstall do
    list = `gem list #{GEM_NAME}`
    installed = list =~ /#{GEM_NAME}/m
    puts "Uninstalling #{GEM_NAME}" if installed
    sh "#{'sudo' unless windows?} gem uninstall #{GEM_NAME}" if installed
  end
   
  desc 'Install the package as a gem'
  task :install => [:uninstall, :gemspec] do
    sh "rm -rf pkg"
    sh "mkdir pkg"
    sh "gem build #{GEM_NAME}.gemspec"
    sh "mv *.gem pkg"
    sh "#{'sudo' unless windows?} gem install pkg/*.gem --no-rdoc --no-ri"
  end
end