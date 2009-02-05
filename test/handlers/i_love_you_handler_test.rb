require File.join(File.dirname(__FILE__), '..', 'test_helper')

class ILoveYouHandlerTest < Test::Unit::TestCase
  context "Basic handling" do
    setup do
      @handler = ILoveYouHandler.new 
      Lokii::Processor.handlers = @handler
    end

    should "respond with messages of love" do
      incoming "i love u"      
      messages = outgoing.map {|m| m[:text] }
      assert_includes messages, "i love u too"
    end
  end  
end    
