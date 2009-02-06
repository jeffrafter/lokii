require File.join(File.dirname(__FILE__), '..', 'test_helper')

class ILoveYouHandlerTest < Test::Unit::TestCase
  running_server_with_handlers :i_love_you_handler do
    should "respond with messages of love" do
      receive 'i love u'
      assert_response 'I love you too'
      assert_response_to '+123456789'
    end
  end  
end    
