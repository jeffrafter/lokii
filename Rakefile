ENV['GEM'] ||= 'lokii'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name        = "#{ENV['GEM']}"
    s.summary     = "Ruby Short Message Service Framework"
    s.email       = "jeff@socialrange.org"
    s.homepage    = "http://socialrange.org/"
    s.description = "Lokii is a Ruby SMS framework for ultimate awesomeness and with configurable servers and handlers."
    s.authors     = ["Jeff Rafter"]
    s.files       = FileList["[A-Z]*.*", "{bin,lib,test,script,examples}/**/*"] + ["config/init.rb", "config/settings.example.yml", "config/database.example.yml"]
    s.executables = "lokii"
  end
rescue LoadError
  puts 'Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com'
end