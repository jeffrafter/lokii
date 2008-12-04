# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{lokii}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeff Rafter"]
  s.date = %q{2008-12-04}
  s.default_executable = %q{lokii}
  s.description = %q{Lokii is a Ruby SMS framework for ultimate awesomeness and with configurable servers and handlers.}
  s.email = %q{jeff@socialrange.org}
  s.executables = ["lokii"]
  s.files = ["README.textile", "VERSION.yml", "bin/lokii", "lib/lokii", "lib/lokii/config.rb", "lib/lokii/handler.rb", "lib/lokii/handlers", "lib/lokii/handlers/i_love_you_handler.rb", "lib/lokii/handlers/ping_handler.rb", "lib/lokii/logger.rb", "lib/lokii/mapper.rb", "lib/lokii/models", "lib/lokii/models/inbox.rb", "lib/lokii/models/multipart_inbox.rb", "lib/lokii/models/outbox.rb", "lib/lokii/models/worker.rb", "lib/lokii/server.rb", "lib/lokii/servers", "lib/lokii/servers/database_server.rb", "lib/lokii.rb", "test/test_helper.rb", "test/unit", "test/unit/i_love_you_handler_test.rb", "script/console", "script/daemon", "script/lokii", "script/smsd", "config/init.rb", "config/process.rb", "config/settings.example.yml", "config/database.example.yml", "config/messages.example.yml"]
  s.homepage = %q{http://socialrange.org/}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Ruby Short Message Service Framework}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
