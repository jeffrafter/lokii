require File.join(File.dirname(__FILE__), '..', 'test_helper')

class PingHandlerTest < Test::Unit::TestCase
  running_server_with_handlers :ping_handler do
    should "respond like an old video game" do
      receive 'ping'
      assert_response 'pong'
      assert_response_to '+123456789'
    end
  end  
end    
