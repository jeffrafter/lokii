# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{lokii}
  s.version = "0.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeff Rafter"]
  s.date = %q{2009-06-30}
  s.default_executable = %q{lokii}
  s.description = %q{Lokii is a Ruby SMS framework for ultimate awesomeness and with configurable servers and handlers.}
  s.email = %q{jeff@socialrange.org}
  s.executables = ["lokii"]
  s.extra_rdoc_files = [
    "README",
    "README.textile"
  ]
  s.files = [
    "README.textile",
    "Rakefile.example",
    "VERSION.yml",
    "bin/lokii",
    "config/boot.rb",
    "config/database.example.yml",
    "config/init.rb",
    "config/messages.example.yml",
    "config/process.rb",
    "config/settings.example.yml",
    "lib/lokii.rb",
    "lib/lokii/config.rb",
    "lib/lokii/handler.rb",
    "lib/lokii/handlers/i_love_you_handler.rb",
    "lib/lokii/handlers/ping_handler.rb",
    "lib/lokii/logger.rb",
    "lib/lokii/models/inbox.rb",
    "lib/lokii/models/multipart_inbox.rb",
    "lib/lokii/models/outbox.rb",
    "lib/lokii/processor.rb",
    "lib/lokii/server.rb",
    "lib/lokii/servers/database_server.rb",
    "lib/lokii/servers/gsm_proxy.rb",
    "lib/lokii/servers/gsm_server.rb",
    "lib/lokii/servers/local_sms_proxy.rb",
    "lib/lokii/servers/local_sms_server.rb",
    "lib/lokii/servers/memory_server.rb",
    "lib/lokii/test.rb",
    "script/console",
    "script/daemon",
    "script/lokii",
    "script/smsd",
    "test/handlers/i_love_you_handler_test.rb",
    "test/handlers/ping_handler_test.rb",
    "test/test_helper.rb"
  ]
  s.homepage = %q{http://socialrange.org/}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Ruby Short Message Service Framework}
  s.test_files = [
    "test/handlers/i_love_you_handler_test.rb",
    "test/handlers/ping_handler_test.rb",
    "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
