require 'lokii/servers/memory_server'

module Lokii
  module Test
    module Macros
      class_eval do 
        def running_server_with_handlers(*args, &block)
          # Arrayify and constantize the handlers list
          args = [args] unless args.is_a? Array
          args.map!{|h| "#{h}".split('_').map!(&:capitalize).join }
          args.map!{|h| Object.module_eval "::#{h}" } 
          context "running server with #{args} handler(s)" do
            setup do      
              @server = Lokii::MemoryServer.new
              @server.stubs(:running?).returns(:true)
              @server.handlers = args.map{|h| h.new}
            end  
            yield
          end  
        end
      end  
    end
    
    module Helpers
      def receive(text, number = "+123456789", sent = Time.now)
        @server.receive(text, number, sent)
      end

      def responses
        @server.process
        @server.outbox
      end

      def assert_response(text)
        messages = responses.map{|m| m[:text]}
        assert messages.include?(text), "'#{text}' not included in #{messages}"
      end

      def assert_response_to(number)
        numbers = responses.map{|m| m[:number]}
        assert numbers.include?(number), "#{number} not included in #{numbers}"
      end
    end  
  end
end


Test::Unit::TestCase.send(:extend, Lokii::Test::Macros)
Test::Unit::TestCase.send(:include, Lokii::Test::Helpers)